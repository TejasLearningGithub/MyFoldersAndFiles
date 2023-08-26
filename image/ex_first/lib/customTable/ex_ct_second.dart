import 'package:flutter/material.dart';


class CustomTable {
  final String cityName;
  final String subColumn1;
  final String subColumn2;

  CustomTable({required this.cityName, required this.subColumn1, required this.subColumn2});
}

class CustomTableWidget extends StatelessWidget {
  final CustomTable tableData;

  CustomTableWidget({super.key, required this.tableData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tableData.cityName, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Row(
          children: [
            Text(tableData.subColumn1),
            SizedBox(width: 12),
            Text(tableData.subColumn2),
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }
}

class MyTableAppFirst extends StatelessWidget {
  final List<CustomTable> data = [
    CustomTable(cityName: 'Mumbai', subColumn1: 'Borivali', subColumn2: 'HO Center'),
  ];

   MyTableAppFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Table Example'),
        ),
        body: Center(
          child: Column(
            children: data.map((entry) => CustomTableWidget(tableData: entry)).toList(),
          ),
        ),
      ),
    );
  }
}
