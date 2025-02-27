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
              customtile(
                  name: "name",
                  time: "time",
                  subtitle: "subtitle",
                  leadingIcon: Icons.phone_in_talk_sharp),
              customtile(
                  name: "Abdullah",
                  time: "time",
                  subtitle: "subtitle",
                  leadingIcon: Icons.phone),
            ],
          ),
        ),
      ),
    );
  }
}
