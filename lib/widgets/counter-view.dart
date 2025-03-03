import 'package:flutter/material.dart';

class Counterview extends StatefulWidget {
  Counterview({super.key});

  @override
  State<Counterview> createState() => _CounterviewState();
}

class _CounterviewState extends State<Counterview> {
  int counter = 0;
  var feriendlistcontroller = TextEditingController();
  List<String> fereind = [
    "Ali",
    "Hassan",
  ];

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void additem() {
    setState(() {
      fereind.add("Ali");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Enter item",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 19.0),
          ),
          controller: feriendlistcontroller,
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(180, 40), // width, height
            ),
            onPressed: () {
              setState(() {
                fereind.add(feriendlistcontroller.text);
                feriendlistcontroller.clear();
              });
              print(feriendlistcontroller.text);
            },
            child: Text("Add item"),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
                                      color: const Color.fromARGB(
                                          255, 227, 230, 233)),
                                ),
                                tileColor: Color.fromARGB(255, 168, 79, 79),
                                trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        fereind.removeAt(index);
                                      });
                                    },
                                    icon: Icon(Icons.delete, size: 20),
                                    color: Colors.white),
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
          ],
        ),
      ),
    );
  }
}
