import 'package:flutter/material.dart';


class CustomTable {
  final String cityName;
  final String column1;
  final String column2;

  CustomTable({required this.cityName, required this.column1, required this.column2});
}

class CustomTableApp extends StatelessWidget {
  final List<CustomTable> data = [
    CustomTable(cityName: 'Mumbai', column1: 'Borivali', column2: 'HO Center'),
    CustomTable(cityName: 'Chennai', column1: 'Chennai ESTZ', column2: ''),
    CustomTable(cityName: 'Delhi', column1: '', column2: 'Delhi Phase 4'),
  ];

   CustomTableApp({super.key});

   

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Table Example'),
        ),
        body: Center(
          child: DataTable(
            columns: [
              DataColumn(label: Text('City')),
              DataColumn(label: Text('Column 1')),
              DataColumn(label: Text('Column 2')),
            ],
            rows: data.map((entry) {
              return DataRow(
                cells: [
                  DataCell(Text(entry.cityName)),
                  DataCell(Text(entry.column1)),
                  DataCell(Text(entry.column2)),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
