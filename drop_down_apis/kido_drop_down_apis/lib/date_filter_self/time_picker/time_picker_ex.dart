import 'package:flutter/material.dart';
import 'package:kido_drop_down_apis/date_filter_self/button/button_widet.dart';

class MyTimePickerWidget extends StatefulWidget {
  const MyTimePickerWidget({super.key});

  @override
  State<MyTimePickerWidget> createState() => _MyTimePickerWidgetState();
}

class _MyTimePickerWidgetState extends State<MyTimePickerWidget> {
  TimeOfDay? time;
  String getText() {
    if (time == null) {
      return 'Select Time';
    } else {
      final hours = time?.hour.toString().padLeft(2, '0');
      final mins = time?.minute.toString().padLeft(2, '0');
      return '$hours : $mins';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ButtonHeaderWidget(
      title: 'Time',
      text: getText(),
      onClicked: () {
        pickTime(context);
      },
    );
  }

  Future pickTime(BuildContext context) async {
    const initialTime = TimeOfDay(hour: 10, minute: 10);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );

    if (newTime == null) {
      return;
    } else {
      setState(() {
        time = newTime;
      });
    }
  }
}
