import 'package:flutter/material.dart';

class Counterview extends StatefulWidget {
  Counterview({super.key});

  @override
  State<Counterview> createState() => _CounterviewState();
}

class _CounterviewState extends State<Counterview> {
  int counter = 0;
  List<String> fereind = [
    "Ali",
    "Hassan",
    "Hussain",
    "Ali",
    "Hassan",
  ];

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
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: fereind.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 1.5),
                        child: ListTile(
                          title: Text(
                            fereind[index],
                            style: TextStyle(
                                color:
                                    const Color.fromARGB(255, 227, 230, 233)),
                          ),
                          tileColor: Color.fromARGB(255, 168, 79, 79),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
