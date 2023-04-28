import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FilterDateData extends StatefulWidget {
  const FilterDateData({super.key});

  @override
  State<FilterDateData> createState() => _FilterDateDataState();
}

class _FilterDateDataState extends State<FilterDateData> {
  @override
  Widget build(BuildContext context) {
    DateTime startDate = DateTime(2022);
    DateTime endDate = DateTime(2024);

    getDaysInBetween() {
      final int diff = endDate.difference(startDate).inDays;
      return diff;
    }

    final items = List<DateTime>.generate(getDaysInBetween(), (index) {
      DateTime date = startDate;
      return date.add(Duration(days: index));
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Using Date'),
        leading: IconButton(
          onPressed: () {
            getDaysInBetween();
          },
          icon: const Icon(Icons.arrow_outward_outlined),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Day ${items[index].day}'),
              subtitle: Text(
                  '${items[index].day}/${items[index].month}/${items[index].year}'),
            ),
          );
        },
      ),
    );
  }
}
