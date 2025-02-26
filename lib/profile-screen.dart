import 'package:flutter/material.dart';
import 'package:flutterfirstproject/widgets/custom-tile.dart';

class whatsapp extends StatelessWidget {
  const whatsapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Whatsapp'),
        titleTextStyle: TextStyle(
          color: const Color.fromARGB(255, 33, 139, 99),
          fontSize: 25,
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              CustomTile(
                title: 'Profile',
                subtitle: 'Tap to view your profile',
                leadingIcon: Icons.account_circle,
                trailingIcon: Icons.arrow_forward_ios,
              ),
              CustomTile(
                title: 'Chats',
                subtitle: 'Tap to view your chats',
                leadingIcon: Icons.chat,
                trailingIcon: Icons.arrow_forward_ios,
              ),
              CustomTile(
                title: 'Calls',
                subtitle: 'Tap to view your calls',
                leadingIcon: Icons.call,
                trailingIcon: Icons.arrow_forward_ios,
              ),
              CustomTile(
                title: 'Settings',
                subtitle: 'Tap to view your settings',
                leadingIcon: Icons.settings,
                trailingIcon: Icons.arrow_forward_ios,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
