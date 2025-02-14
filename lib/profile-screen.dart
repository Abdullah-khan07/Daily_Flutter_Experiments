import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart' as video_player;
import 'package:video_player/video_player.dart';
import 'package:video_player/video_player.dart';

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
  int _selectedIndex = 0;

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

  final List<String> videos = [
    'https://www.w3schools.com/html/mov_bbb.mp4',
    'https://www.w3schools.com/html/movie.mp4',
    'https://www.w3schools.com/html/mov_bbb.mp4',
    'https://www.w3schools.com/html/movie.mp4',
    'https://www.w3schools.com/html/mov_bbb.mp4',
    'https://www.w3schools.com/html/movie.mp4',
    'https://www.w3schools.com/html/mov_bbb.mp4',
    'https://www.w3schools.com/html/movie.mp4',
    'https://www.w3schools.com/html/mov_bbb.mp4',
    'https://www.w3schools.com/html/movie.mp4',
  ];

  final List<String> messages = [
    'Hey, how are you?',
    'Let\'s catch up soon!',
    'Did you see the game last night?',
    'Happy Birthday!',
    'Good morning!',
    'What\'s up?',
    'Long time no see!',
    'Can you send me the report?',
    'Let\'s meet for lunch.',
    'Have a great day!'
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ChatsScreen(names: filteredNames, images: images, messages: messages),
          StatusScreen(names: filteredNames, images: images, videos: videos),
          CallsScreen(names: filteredNames, images: images),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF075E54),
        onTap: _onItemTapped,
      ),
    );
  }
}

class ChatsScreen extends StatelessWidget {
  final List<String> names;
  final List<String> images;
  final List<String> messages;

  const ChatsScreen(
      {super.key,
      required this.names,
      required this.images,
      required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(images[index]),
          ),
          title: Text(names[index]),
          subtitle: Text(messages[index]),
          trailing: Text('12:00 PM'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailScreen(
                  name: names[index],
                  imageUrl: images[index],
                  message: messages[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class StatusScreen extends StatelessWidget {
  final List<String> names;
  final List<String> images;
  final List<String> videos;

  const StatusScreen(
      {super.key,
      required this.names,
      required this.images,
      required this.videos});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(images[0]),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          title: Text('My Status'),
          subtitle: Text('Tap to add status update'),
          onTap: () {
            // Handle adding status
          },
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Recent updates'),
        ),
        ...List.generate(names.length, (index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(images[index]),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black.withOpacity(0.5),
                child: CircularProgressIndicator(
                  value: 0.7, // Example progress value
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            ),
            title: Text(names[index]),
            subtitle: Text('Today, 12:00 PM'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StatusDetailScreen(
                    name: names[index],
                    imageUrl: images[index],
                    videoUrl: videos[index],
                  ),
                ),
              );
            },
          );
        }),
      ],
    );
  }
}

class CallsScreen extends StatelessWidget {
  final List<String> names;
  final List<String> images;

  const CallsScreen({super.key, required this.names, required this.images});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(images[index]),
          ),
          title: Text(names[index]),
          subtitle: Text('Last call from ${names[index]}'),
          trailing: Icon(Icons.call),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactScreen(
                  name: names[index],
                  imageUrl: images[index],
                ),
              ),
            );
          },
        );
      },
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

class ChatDetailScreen extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String message;

  const ChatDetailScreen(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    title: Text(name),
                    subtitle: Text(message),
                  ),
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatusDetailScreen extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String videoUrl;

  const StatusDetailScreen(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.videoUrl});

  @override
  _StatusDetailScreenState createState() => _StatusDetailScreenState();
}

class _StatusDetailScreenState extends State<StatusDetailScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: video_player.VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
