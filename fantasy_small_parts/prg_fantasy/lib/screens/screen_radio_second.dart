import 'package:flutter/material.dart';

class RadioScreenSecond extends StatefulWidget {
  const RadioScreenSecond({super.key});

  @override
  State<RadioScreenSecond> createState() => _RadioScreenSecondState();
}

enum RadioGender {
  male,
  female,
  other,
}

class _RadioScreenSecondState extends State<RadioScreenSecond> {
  // RadioGender _radioVenue = RadioGender.male;
  String? _selectedValue;
  bool _radioVenue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remove Space between circle and text '),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedValue = 'Male';
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: Colors.blue,
                        groupValue: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        },
                        value: 'Male',
                      ),
                      Text('Male')
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedValue = 'Female';
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: Colors.blue,
                        groupValue: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        },
                        value: 'Female',
                      ),
                      Text('Female')
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedValue = 'Other';
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: Colors.blue,
                        groupValue: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        },
                        value: 'Other',
                      ),
                      Text('Other')
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
