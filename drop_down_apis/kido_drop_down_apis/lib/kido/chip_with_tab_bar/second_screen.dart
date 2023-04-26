import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'It is a second layout tab, which is responsible for taking pictures from your mobile.',
        style: TextStyle(fontSize: 35.0),
      ),
    );
  }
}
