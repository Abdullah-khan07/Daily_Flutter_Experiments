import 'package:flutter/material.dart';

class customtile extends StatelessWidget {
  final String name;
  final String time;
  final String subtitle;
  final IconData leadingIcon;

  const customtile(
      {super.key,
      required this.name,
      required this.time,
      required this.subtitle,
      required this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2),
      child: ListTile(
        title: Text(name),
        subtitle: Text(subtitle),
        leading: Icon(leadingIcon),
        trailing: Text(time),
      ),
    );
  }
}
