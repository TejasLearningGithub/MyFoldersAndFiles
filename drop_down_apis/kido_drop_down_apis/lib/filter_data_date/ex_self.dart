import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kido_drop_down_apis/common/app_theme.dart';
import 'package:kido_drop_down_apis/filter_data_date/AppTextField.dart';
import 'package:kido_drop_down_apis/filter_data_date/extension.dart';

class ExDateFilterData extends StatefulWidget {
  const ExDateFilterData({super.key});

  @override
  State<ExDateFilterData> createState() => _ExDateFilterDataState();
}

class _ExDateFilterDataState extends State<ExDateFilterData> {
  var controllerFirst = TextEditingController();
  var controllerSecond = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // DateTime startDate = DateTime.parse(controllerFirst.text);
    // DateTime endDate = DateTime.parse(controllerSecond.text);

    //=============================================================
    //DateTime startDate = DateTime.parse(controllerSecond.text);
    DateTime endDate = DateTime.utc(2022, 1, 5);
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    DateTime startDate =
        formatter.format(DateTime.parse(controllerSecond.text)) as DateTime;

    getDaysInBetween() {
      final int diff = endDate.difference(startDate).inDays;
      return diff;
    }

    final item = List<DateTime>.generate(getDaysInBetween(), (index) {
      DateTime date = startDate;
      return date.add(Duration(days: index));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Filter By Date'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          dateRange(context),
          Expanded(
            child: ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('Day ${item[index].day}'),
                    subtitle: Text(
                      '${item[index].day}/${item[index].month}/${item[index].year}',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  AppTextField dateRange(BuildContext context) {
    return AppTextField(
      controller: controllerSecond,
      labelText: 'Select Date Range',
      hintText: 'Select Date Range',
      isRequired: false,
      readOnly: true,
      onTap: () async {
        await showDatePicker(
          helpText: 'SELECT FIRST DATE',
          confirmText: 'PICK NEXT DATE',
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2001),
          lastDate: DateTime(2024),
          builder: (context, child) {
            return Theme(data: dateTimePickerTheme, child: child!);
          },
        ).then((value) async {
          if (value != null) {
           // controllerFirst.text = DateTime;
            //log(value.toDDMMYYYY(), name: 'firstDate');
            await showDatePicker(
              helpText: 'SELECT LAST DATE',
              context: context,
              initialDate: value,
              firstDate: value,
              lastDate: DateTime(2024),
              builder: (context, child) {
                return Theme(data: dateTimePickerTheme, child: child!);
              },
            ).then((value) {
              //controllerSecond.text = '1/2/2022';
              //log(value?.toDDMMYYYY() ?? 'nope', name: 'lastDate');
            });
          }
        });
      },
    );
  }
}
