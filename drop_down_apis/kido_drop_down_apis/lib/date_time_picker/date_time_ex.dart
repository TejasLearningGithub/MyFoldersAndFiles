import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kido_drop_down_apis/filter_data_date/extension.dart';

class MyDateAndTimePicker extends StatefulWidget {
  const MyDateAndTimePicker({super.key});

  @override
  State<MyDateAndTimePicker> createState() => _MyDateAndTimePickerState();
}

var firstController = TextEditingController();
var secondController = TextEditingController();
int diff = 0;
var start;
var end;

class _MyDateAndTimePickerState extends State<MyDateAndTimePicker> {
  @override
  void initState() {
    super.initState();
    firstController.text = '';
    secondController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Using Dates'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: firstController,
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  String formmatedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  setState(() {
                    firstController.text = formmatedDate;
                  });
                  print(firstController.text);
                }
              },
            ),
            TextField(
              readOnly: true,
              controller: secondController,
              onTap: () async {
                DateTime? pickedSecondDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedSecondDate != null) {
                  String formmatedSecondDate =
                      DateFormat('yyyy-MM-dd').format(pickedSecondDate);
                  setState(() {
                    secondController.text = formmatedSecondDate;
                  });
                  print(secondController.text);
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    getDaysInBetween();
                  });
                },
                child: Text('Generate List')),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('abc'),
                    ),
                  );
                }),
            Text(items.toString())
          ],
        ),
      ),
    );
  }

  final items = List<DateTime>.generate(getDaysInBetween(), (index) {
    //DateTime date = start;

    print(index);

    //return start.add(Duration(days: index));
    return DateTime.utc(2024,1,1); 
  });
}

getDaysInBetween() {
  // print(firstController.text.toString());
  // print(secondController.text.toString());
  try {
    start = DateTime.parse(firstController.text.toString());
    end = DateTime.parse(secondController.text.toString());

    log(start.toString());
    log(end.toString());

    diff = end.difference(start).inDays;
  } catch (e) {
    log('Error = ' + e.toString());
  }
  return diff;
}
