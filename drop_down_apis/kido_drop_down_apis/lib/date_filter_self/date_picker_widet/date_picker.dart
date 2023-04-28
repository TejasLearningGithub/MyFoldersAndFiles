import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:kido_drop_down_apis/date_filter_self/button/button_widet.dart';

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({super.key});

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateTime? dateTime;

  String getText() {
    if (dateTime == null) {
      return 'Select Date';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateTime!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ButtonHeaderWidget(
      title: 'Date',
      text: getText(),
      onClicked: () {
        pickDate(context);
      },
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (newDate == null) {
      return;
    } else {
      setState(() {
        dateTime = newDate;
      });
    }
  }
}
