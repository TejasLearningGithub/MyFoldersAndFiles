import 'package:flutter/material.dart';

class DynamicRadioList extends StatefulWidget {
  @override
  _DynamicRadioListState createState() => _DynamicRadioListState();
}

class _DynamicRadioListState extends State<DynamicRadioList> {
  String? _selectedValue;
  List<String> _items = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _items.map((item) {
          return SizedBox(
            width: 110,
            height: 100,
            child: RadioListTile(
              dense: true,
              contentPadding: EdgeInsets.all(0.0),
              title: Text(
                item,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: item,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Radio List'),
      ),
      body: DynamicRadioList(),
    ),
  ));
}
