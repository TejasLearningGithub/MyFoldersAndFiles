import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MultiplePickerSample extends StatefulWidget {
  @override
  _MultiplePickerSampleState createState() => _MultiplePickerSampleState();
}

class _MultiplePickerSampleState extends State<MultiplePickerSample> {
  String? firstDate;
  String? secondDate;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Card(
        //   margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
        //   child: SfDateRangePicker(
        //     view: DateRangePickerView.month,
        //     selectionMode: DateRangePickerSelectionMode.range,
        //     enableMultiView: true,

        //   ),
        // ),
        ElevatedButton(
            onPressed: () {
              _openDateRangePicker(context);
            },
            child: Text('Press')),
        Text(firstDate ?? ''),
        Text(secondDate ?? '')
      ],
    ));
  }

  //===========================================================================
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      final DateTime? rangeStartDate = args.value.startDate;
      final DateTime? rangeEndDate = args.value.endDate;
      print(rangeStartDate);
      print(rangeEndDate);
      //print(
      //    'Formmated Date Start =${DateFormat('dd/MM/yyyy').format(rangeStartDate)}');
      // print(
      //     'Formmated Date End =${DateFormat('dd/MM/yyyy').format(rangeEndDate)}');
      firstDate =
          DateFormat('dd/MM/yyyy').format(rangeStartDate ?? DateTime.now());
      secondDate =
          DateFormat('dd/MM/yyyy').format(rangeEndDate ?? DateTime.now());
    }

    //  else if (args.value is DateTime) {
    //    final DateTime selectedDate = args.value;
    //  } else if (args.value is List<DateTime>) {
    //    final List<DateTime> selectedDates = args.value;
    //  } else {
    //    final List<PickerDateRange> selectedRanges = args.value;
    //  }
  }

  //============================================================================
  Future<void> _openDateRangePicker(BuildContext context) async {
    DateRangePickerSelectionMode _selectionMode =
        DateRangePickerSelectionMode.range;
    SfDateRangePicker _dateRangePicker = SfDateRangePicker(
        view: DateRangePickerView.month,
        selectionMode: DateRangePickerSelectionMode.range,
        // initialSelectedRange: PickerDateRange(
        //   DateTime.now().subtract(Duration(days: 7)),
        //   DateTime.now(),
        // ),
        // onSelectionChanged: (PickerDateRange dateRange) {
        //   // Do something with the selected date range
        //   print(dateRange.startDate);
        //   print(dateRange.endDate);
        // },
        enableMultiView: true,
        onSelectionChanged: _onSelectionChanged);

    // await showDialog(

    //     context: context,
    //     builder: (BuildContext context) {
    //       return SizedBox(

    //         height: 300,
    //         width: 300,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [_dateRangePicker],
    //         ),
    //       );
    //     });
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          title: Text('Select Date'),
          content: Container(
            width: double.maxFinite, // specify the desired width
            height: 300.0, // specify the desired height
            child: _dateRangePicker,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  firstDate;
                  secondDate;
                });
                Navigator.of(context).pop();
              },
              child: const Text(
                'Select',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }
}
