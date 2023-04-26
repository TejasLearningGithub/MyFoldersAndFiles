//This example demomstrate chips - permenant
import 'package:flutter/material.dart';

class MyExampleSecond extends StatefulWidget {
  const MyExampleSecond({super.key});

  @override
  State<MyExampleSecond> createState() => _MyExampleSecondState();
}

class _MyExampleSecondState extends State<MyExampleSecond> {
  int? _selectedIndex = 0;
  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ChoiceChip(
                    label: const Text('My First Chip'),
                    selected: _value == 0 ? true : false,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = 0;
                      });
                    },
                    selectedColor: Colors.blue,
                    disabledColor: Colors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ChoiceChip(
                    label: const Text('My Second Chip'),
                    selected: _value == 1 ? true : false,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = 1;
                      });
                    },
                    selectedColor: Colors.blue,
                    disabledColor: Colors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ChoiceChip(
                    label: const Text('My Third Chip'),
                    selected: _value == 2 ? true : false,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = 2;
                      });
                    },
                    selectedColor: Colors.blue,
                    disabledColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          IndexedStack(
            index: _value,
            children: const [
              Text('First Chip Pressed'),
              Text('Second Chip Pressed'),
              Text('Third Chip Pressed')
            ],
          )
        ],
      ),
    );
  }
}
