import 'package:flutter/material.dart';
import 'package:flutterfirstproject/profile-screen.dart';
import 'package:flutterfirstproject/widgets/counter-view.dart';
import 'package:flutterfirstproject/widgets/custom-tile.dart';
import 'package:flutterfirstproject/widgets/expanded.dart';
import 'package:flutterfirstproject/widgets/grid-view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: GridViewExample()),
    );
  }
}
