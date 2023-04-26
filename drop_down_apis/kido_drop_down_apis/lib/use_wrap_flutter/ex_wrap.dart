import 'package:flutter/material.dart';

class WrapW extends StatelessWidget {
  const WrapW({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GeeksForGeeks"),
      ),
      body: Wrap(
        // direction: Axis.vertical,
        // alignment: WrapAlignment.center,
        // spacing:8.0,
        // runAlignment:WrapAlignment.center,
        // runSpacing: 8.0,
        // crossAxisAlignment: WrapCrossAlignment.center,
        // textDirection: TextDirection.rtl,
        // verticalDirection: VerticalDirection.up,
        children: <Widget>[
          Container(
              color: Colors.blue,
              width: 100,
              height: 100,
              child: const Center(
                  child: Text(
                "W1",
                textScaleFactor: 2.5,
              ))),
          const Text(
              'This is my work This is my work This is my work This is my work This is my work This is my work'),
          Container(
              color: Colors.teal,
              width: 100,
              height: 100,
              child: const Center(
                  child: Text(
                "W3",
                textScaleFactor: 2.5,
              ))),
          Container(
              color: Colors.indigo,
              width: 100,
              height: 100,
              child: const Center(
                  child: Text(
                "W4",
                textScaleFactor: 2.5,
              ))),
          Container(
              color: Colors.orange,
              width: 100,
              height: 100,
              child: const Center(
                  child: Text(
                "W5",
                textScaleFactor: 2.5,
              ))),
        ],
      ),
    );
  }
}
