import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final IconData trailingIcon;

  CustomTile({
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    required this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2),
      child: ListTile(
        leading: Icon(leadingIcon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(trailingIcon),
      ),
    );
  }
}
