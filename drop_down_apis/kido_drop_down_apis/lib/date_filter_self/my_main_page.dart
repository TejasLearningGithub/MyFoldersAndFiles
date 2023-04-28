import 'package:flutter/material.dart';
import 'package:kido_drop_down_apis/date_filter_self/date_picker_widet/date_picker.dart';
import 'package:kido_drop_down_apis/date_filter_self/date_range_picker/date_range_picker_ex.dart';
import 'package:kido_drop_down_apis/date_filter_self/date_time_picker/date_time_picker.dart';
import 'package:kido_drop_down_apis/date_filter_self/send_data/send_data_screen.dart';
import 'package:kido_drop_down_apis/date_filter_self/time_picker/time_picker_ex.dart';

class DateAndTimePickerPage extends StatefulWidget {
  const DateAndTimePickerPage({super.key});

  @override
  _DateAndTimePickerPageState createState() => _DateAndTimePickerPageState();
}

class _DateAndTimePickerPageState extends State<DateAndTimePickerPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: buildBottomBar(),
        body: buildPages(),
      );

  Widget buildBottomBar() {
    final style = TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Text('DatePicker', style: style),
          label: 'Basic',
        ),
        BottomNavigationBarItem(
          icon: Text('DatePicker', style: style),
          label: 'Advanced',
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return Scaffold(
          backgroundColor: Colors.lightBlue,
          body: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                MyDatePicker(),
                SizedBox(height: 24),
                MyTimePickerWidget(),
                SizedBox(height: 24),
                DateRangePickerEx(),
                SizedBox(height: 10),
                //SendDataToAnotherScreen(),
              ],
            ),
          ),
        );
      case 1:
        return Scaffold(
          backgroundColor: Colors.lightBlue,
          body: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                MyDateTimePicker(),
              ],
            ),
          ),
        );
      default:
        return Container();
    }
  }
}
