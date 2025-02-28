import 'package:flutter/material.dart';

class Counterview extends StatefulWidget {
  Counterview({super.key});

  @override
  State<Counterview> createState() => _CounterviewState();
}

class _CounterviewState extends State<Counterview> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "Counter: $counter",
                    style: TextStyle(fontSize: 27),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: incrementCounter,
                    child: Text(
                      "Increment",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 0.5),
                  child: ListTile(
                    tileColor: Color.fromARGB(255, 57, 53, 99),
                    title: Text(
                      'Item $index',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'khan hai larke',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
