import 'package:flutter/material.dart';
import 'dart:math';

class WhatsApp extends StatelessWidget {
  const WhatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF075E54),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF25D366),
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF075E54),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const WhatsAppUI(),
    );
  }
}

class WhatsAppUI extends StatefulWidget {
  const WhatsAppUI({super.key});

  @override
  _WhatsAppUIState createState() => _WhatsAppUIState();
}

class _WhatsAppUIState extends State<WhatsAppUI> {
  final List<String> names = [
    'Ahmed',
    'Fatima',
    'Hassan',
    'Ayesha',
    'Omar',
    'Zainab',
    'Ali',
    'Maryam',
    'Yusuf',
    'Khadija'
  ];

  final List<String> images = [
    'https://randomuser.me/api/portraits/men/1.jpg',
    'https://randomuser.me/api/portraits/women/1.jpg',
    'https://randomuser.me/api/portraits/men/2.jpg',
    'https://randomuser.me/api/portraits/women/2.jpg',
    'https://randomuser.me/api/portraits/men/3.jpg',
    'https://randomuser.me/api/portraits/women/3.jpg',
    'https://randomuser.me/api/portraits/men/4.jpg',
    'https://randomuser.me/api/portraits/women/4.jpg',
    'https://randomuser.me/api/portraits/men/5.jpg',
    'https://randomuser.me/api/portraits/women/5.jpg',
  ];

  TextEditingController searchController = TextEditingController();
  List<String> filteredNames = [];

  @override
  void initState() {
    super.initState();
    filteredNames = names;
    searchController.addListener(() {
      filterNames();
    });
  }

  void filterNames() {
    List<String> results = [];
    if (searchController.text.isEmpty) {
      results = names;
    } else {
      results = names
          .where((name) =>
              name.toLowerCase().contains(searchController.text.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredNames = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(names, images),
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu item selection
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'New group',
                  child: Text('New group'),
                ),
                const PopupMenuItem<String>(
                  value: 'New broadcast',
                  child: Text('New broadcast'),
                ),
                const PopupMenuItem<String>(
                  value: 'WhatsApp Web',
                  child: Text('WhatsApp Web'),
                ),
                const PopupMenuItem<String>(
                  value: 'Starred messages',
                  child: Text('Starred messages'),
                ),
                const PopupMenuItem<String>(
                  value: 'Settings',
                  child: Text('Settings'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filteredNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(images[index]),
                  ),
                  title: Text(filteredNames[index]),
                  subtitle: Text('Last message from ${filteredNames[index]}'),
                  trailing: Text('12:00 PM'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactScreen(
                          name: filteredNames[index],
                          imageUrl: images[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            color: Colors.grey[200],
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.emoji_emotions),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<String> names;
  final List<String> images;

  CustomSearchDelegate(this.names, this.images);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var name in names) {
      if (name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(images[names.indexOf(result)]),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactScreen(
                  name: result,
                  imageUrl: images[names.indexOf(result)],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var name in names) {
      if (name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(images[names.indexOf(result)]),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactScreen(
                  name: result,
                  imageUrl: images[names.indexOf(result)],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class ContactScreen extends StatelessWidget {
  final String name;
  final String imageUrl;

  const ContactScreen({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
