import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key, required bool isDismissible});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? _chosenValue;
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        suffix: null,
        suffixIcon: Icon(Icons.keyboard_arrow_down_outlined),
        hintText: 'Please Select State',
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.amberAccent, width: 2), //<-- SEE HERE
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.amberAccent, width: 2), //<-- SEE HERE
        ),
        filled: true,
        fillColor: Colors.greenAccent,
      ),
      dropdownColor: Colors.greenAccent,
      value: dropdownValue,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Dog', 'Cat', 'Tiger', 'Lion']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: 20),
          ),
        );
      }).toList(),
    );
  }
}
