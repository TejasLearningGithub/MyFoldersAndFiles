import 'package:flutter/material.dart';
import 'package:prg_fantasy/components/radio_button.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio'),
      ),
      body: Column(
        children: [
          DynamicRadioList(),
        ],
      ),
    );
  }
}
