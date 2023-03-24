import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class ExFirst extends StatefulWidget {
  const ExFirst({super.key});

  @override
  State<ExFirst> createState() => _ExFirstState();
}

class _ExFirstState extends State<ExFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Range Picker'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                List<DateTime>? dateTimeList =
                    await showOmniDateTimeRangePicker(
                      
                  type: OmniDateTimePickerType.date,
                  context: context,
                  startInitialDate: DateTime.now(),
                  startFirstDate:
                      DateTime(1600).subtract(const Duration(days: 3652)),
                  startLastDate: DateTime.now().add(
                    const Duration(days: 3652),
                  ),
                  endInitialDate: DateTime.now(),
                  endFirstDate:
                      DateTime(1600).subtract(const Duration(days: 3652)),
                  endLastDate: DateTime.now().add(
                    const Duration(days: 3652),
                  ),
                  // is24HourMode: null,
                  // isShowSeconds: null,
                  minutesInterval: 1,
                  secondsInterval: 1,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  constraints: const BoxConstraints(
                    maxWidth: 350,
                    maxHeight: 647,
                  ),
                  transitionBuilder: (context, anim1, anim2, child) {
                    return FadeTransition(
                      opacity: anim1.drive(
                        Tween(
                          begin: 0,
                          end: 1,
                        ),
                      ),
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 200),
                  barrierDismissible: true,
                  selectableDayPredicate: (dateTime) {
                    // Disable 25th Feb 2023
                    if (dateTime == DateTime(2023, 2, 25)) {
                      return false;
                    } else {
                      return true;
                    }
                  },
                );

                print("Start dateTime: ${dateTimeList?[0]}");
                print("End dateTime: ${dateTimeList?[1]}");
              },
              child: const Text("Show DateTime Range Picker"),
            ),
          ],
        ),
      ),
    );
  }
}
