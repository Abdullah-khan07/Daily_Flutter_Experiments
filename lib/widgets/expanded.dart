import 'package:flutter/material.dart';

class ColorfulContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  height: 100,
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    height: 100,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                  ),
                ),
                Container(
                  color: const Color.fromARGB(255, 44, 113, 170),
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
