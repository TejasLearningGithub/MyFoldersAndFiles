import 'package:flutter/material.dart';

class AnimatedAlignWidet extends StatefulWidget {
  const AnimatedAlignWidet({super.key});

  @override
  State<AnimatedAlignWidet> createState() => _AnimatedAlignWidetState();
}

class _AnimatedAlignWidetState extends State<AnimatedAlignWidet> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Align Widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Container(
                height: 150,
                width: 350,
                color: Colors.lightBlue,
                child: AnimatedAlign(
                  alignment: selected ? Alignment.topRight : Alignment.topLeft,
                  duration: const Duration(milliseconds: 500),
                  child: const FlutterLogo(
                    size: 50,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
