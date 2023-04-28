import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kido_drop_down_apis/date_filter_self/button/button_widet.dart';
import 'package:kido_drop_down_apis/date_filter_self/send_data/send_data_screen.dart';

class DateRangePickerEx extends StatefulWidget {
  const DateRangePickerEx({super.key});

  @override
  State<DateRangePickerEx> createState() => _DateRangePickerExState();
}

class _DateRangePickerExState extends State<DateRangePickerEx> {
  DateTimeRange? dateRange;

  String getFrom() {
    if (dateRange == null) {
      return 'from';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateRange!.start);
    }
  }

  String getUntil() {
    if (dateRange == null) {
      return 'until';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateRange!.end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return HeaderWidet(
      title: 'Date Range',
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ButtonWidget(
                  text: getFrom(),
                  onClicked: () => pickDateRange(context),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              const Icon(Icons.arrow_forward),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: ButtonWidget(
                  text: getUntil(),
                  onClicked: () => pickDateRange(context),
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SendDataToAnotherScreen(
                      start: dateRange?.start,
                      end: dateRange?.end,
                    ),
                  ),
                );
              },
              child: const Text('Send Data'))
        ],
      ),
    );
  }

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(hours: 24 * 3)),
    );

    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      initialDateRange: dateRange ?? initialDateRange,
    );

    if (newDateRange == null) {
      return;
    } else {
      setState(() {
        dateRange = newDateRange;
      });
    }
  }
}
