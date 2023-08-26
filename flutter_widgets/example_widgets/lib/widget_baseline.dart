import 'package:flutter/material.dart';

class WidgetBaseline extends StatelessWidget {
  const WidgetBaseline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Base Line Widget'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.green,
          child: Baseline(
            baseline: 25,
            baselineType: TextBaseline.alphabetic,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.purple.shade400,
            ),
          ),
        ),
      ),
    );
  }
}
