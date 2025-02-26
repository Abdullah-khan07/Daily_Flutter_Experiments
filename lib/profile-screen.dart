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
                title: 'Abdullah',
                subtitle: 'Hello',
                leadingIcon: Icons.person,
                trailingIcon: Icons.downhill_skiing,
              ),
              CustomTile(
                  title: 'Ali',
                  subtitle: 'Hi',
                  leadingIcon: Icons.person,
                  trailingIcon: Icons.downhill_skiing),
            ],
          ),
        ),
      ),
    );
  }
}
