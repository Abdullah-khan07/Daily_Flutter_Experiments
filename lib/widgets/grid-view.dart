import 'package:flutter/material.dart';

class GridViewExample extends StatefulWidget {
  const GridViewExample({super.key});

  @override
  _GridViewExampleState createState() => _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  List<Map<String, String>> images = List.generate(
    20,
    (index) => {
      'url': 'https://picsum.photos/200/300?random=$index',
      'name': 'Image $index',
    },
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  // Function to filter images based on search query
  List<Map<String, String>> getFilteredImages() {
    return images.where((img) {
      return _searchQuery.isEmpty ||
          img['name']!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  // Function to delete image
  void deleteImage(int index) {
    setState(() {
      images.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredImages = getFilteredImages();

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildGridView(filteredImages),
                _buildListView(filteredImages),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildTabBar(),
    );
  }

  // Search Bar Widget
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Search...",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
      ),
    );
  }

  // Grid View Widget
  Widget _buildGridView(List<Map<String, String>> filteredImages) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.75,
        ),
        itemCount: filteredImages.length,
        itemBuilder: (context, index) {
          return _buildImageCard(filteredImages[index], index);
        },
      ),
    );
  }

  // List View Widget with Delete Option
  Widget _buildListView(List<Map<String, String>> filteredImages) {
    return ListView.builder(
      itemCount: filteredImages.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.network(filteredImages[index]['url']!,
              width: 50, height: 50, fit: BoxFit.cover),
          title: Text(filteredImages[index]['name']!),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => deleteImage(index),
          ),
        );
      },
    );
  }

  // Image Card for Grid View
  Widget _buildImageCard(Map<String, String> imageData, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: BorderRadius.circular(19.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.network(
                    imageData['url']!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                          child: Text('Failed to load',
                              style: TextStyle(color: Colors.white)));
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  imageData['name']!,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Tab Bar Widget (Bottom)
  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.blue,
      tabs: [
        Tab(icon: Icon(Icons.image), text: 'image'),
        Tab(icon: Icon(Icons.list), text: 'List'),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
