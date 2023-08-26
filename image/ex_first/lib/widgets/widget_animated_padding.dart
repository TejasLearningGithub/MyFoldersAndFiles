import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetAnimatedPadding extends StatefulWidget {
  const WidgetAnimatedPadding({super.key});

  @override
  State<WidgetAnimatedPadding> createState() => _WidgetAnimatedPaddingState();
}

class _WidgetAnimatedPaddingState extends State<WidgetAnimatedPadding> {
  double padValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Padding'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                padValue = padValue == 0 ? 100 : 0;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
            ),
            child: const Text('Change Padding'),
          ),
          Text('Padding = $padValue'),
          AnimatedPadding(
            padding: EdgeInsets.all(padValue),
            duration: Duration(seconds: durationInSecond()),
            curve: Curves.easeInOut,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  int durationInSecond() {
    if (padValue < 50) {
      log('Reaches less than 50');
    } else if (padValue > 50) {
      log('Reaches More Than 50');
    } else if (padValue == 100) {
      log('Reached At 100');
    }
    // return 1.0;
    return 10;
  }
}
