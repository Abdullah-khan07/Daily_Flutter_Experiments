import 'package:flutter/material.dart';

class Counterview extends StatefulWidget {
  Counterview({super.key});

  @override
  State<Counterview> createState() => _CounterviewState();
}

class _CounterviewState extends State<Counterview> {
  int value1 = 0;
  int value2 = 0;
  int sum = 0;
  sumtwovalue() {
    setState(() {
      sum = value1 + value2;
    });
    print(sum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter first value'),
              onChanged: (text) {
                value1 = int.tryParse(text) ?? 0;
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter second value'),
              onChanged: (text) {
                value2 = int.tryParse(text) ?? 0;
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  sumtwovalue();
                });
                print(sum);
              },
              child: Text("Calculate Sum"),
            ),
            Text(
              "Sum = $sum",
              style: TextStyle(fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }
}
