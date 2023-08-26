import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetCupertinoSegment extends StatefulWidget {
  const WidgetCupertinoSegment({super.key});

  @override
  State<WidgetCupertinoSegment> createState() => _WidgetCupertinoSegmentState();
}

class _WidgetCupertinoSegmentState extends State<WidgetCupertinoSegment> {
  String? currentText = 'Segment';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cupertino Segmented Widget'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CupertinoSegmentedControl(
              children: {
                'Flutter': Container(
                  color: currentText == 'Flutter'
                      ? Colors.orange.shade900
                      : Colors.green,
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: const Text('Flutter'),
                ),
                'Mapp': Container(
                  color: currentText == 'Mapp' ? Colors.amber : Colors.blueGrey,
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: const Text('Mapp'),
                ),
                'Youtube': Container(
                  color: currentText == 'Youtube'
                      ? Colors.orangeAccent
                      : Colors.lime,
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: const Text('Youtube'),
                ),
              },
              onValueChanged: (String value) {
                setState(() {
                  currentText = value;
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            currentText != null
                ? Text(
                    currentText!,
                    style: const TextStyle(
                      fontSize: 50,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
