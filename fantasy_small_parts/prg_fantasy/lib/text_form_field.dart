import 'package:flutter/material.dart';

class NonDeletableTextEditingController extends TextEditingController {
  @override
  set value(TextEditingValue newValue) {
    // Prevent deletion of text
    if (newValue.text.length < text.length) {
      // Set the selection at the end of the text
      final newSelection = TextSelection.collapsed(offset: text.length);
      super.value = newValue.copyWith(selection: newSelection);
    } else {
      // Set the new value as usual
      super.value = newValue;
    }
  }
}

class MyHomeApp extends StatelessWidget {
  final nonDeletableController = NonDeletableTextEditingController();

  MyHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Non-Deletable TextFormField'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              controller: nonDeletableController,
              decoration: InputDecoration(
                labelText: 'Non-Deletable Text',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
