import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:kido_drop_down_apis/date_filter_self/button/button_widet.dart';

class MyDateTimePicker extends StatefulWidget {
  const MyDateTimePicker({super.key});

  @override
  State<MyDateTimePicker> createState() => _MyDateTimePickerState();
}

class _MyDateTimePickerState extends State<MyDateTimePicker> {
  DateTime? dateTime;

  String getText() {
    if (dateTime == null) {
      return 'Select Date And Time';
    } else {
      return DateFormat('dd/MM/yyyy HH:mm').format(dateTime!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ButtonHeaderWidget(
      title: 'Date Time',
      text: getText(),
      onClicked: () => pickDateTime(context),
    );
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async {
    const initialTime = TimeOfDay(hour: 9, minute: 10);
    final newTime = await showTimePicker(
      context: context,
      initialTime: dateTime != null
          ? TimeOfDay(hour: dateTime!.hour, minute: dateTime!.minute)
          : initialTime,
    );
    if (newTime == null) {
      return null;
    } else {
      return newTime;
    }
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (newDate == null) {
      return null;
    } else {
      return newDate;
    }
  }

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) {
      return;
    }
    final time = await pickTime(context);
    if (time == null) {
      return;
    }

    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        date.hour,
        date.minute,
      );
    });
  }
}
