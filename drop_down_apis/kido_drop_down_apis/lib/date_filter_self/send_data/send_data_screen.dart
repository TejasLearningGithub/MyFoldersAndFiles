import 'package:flutter/material.dart';

class SendDataToAnotherScreen extends StatefulWidget {
  final DateTime? start;
  final DateTime? end;
  const SendDataToAnotherScreen({super.key, this.start, this.end});

  @override
  State<SendDataToAnotherScreen> createState() =>
      _SendDataToAnotherScreenState();
}

class _SendDataToAnotherScreenState extends State<SendDataToAnotherScreen> {
  @override
  Widget build(BuildContext context) {
    getDaysInBetween() {
      final int diff = widget.end!.difference(widget.start!).inDays;
      return diff;
    }

    final items = List.generate(getDaysInBetween(), (index) {
      return widget.start?.add(Duration(days: index));
    });

    return Scaffold(
        body: Container(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text('Value for first date '),
          Text('day = ' + widget.start!.day.toString()),
          Text('month = ' + widget.start!.month.toString()),
          Text('year = ' + widget.start!.year.toString()),
          const Text('============================='),
          const Text('Value for second date '),
          Text('day = ' + widget.end!.day.toString()),
          Text('month = ' + widget.end!.month.toString()),
          Text('year = ' + widget.end!.year.toString()),
          Text('Diffrence Between Two Dates'),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('${items[index]!.day}'),
                    subtitle: Text(
                        '${items[index]!.day}/${items[index]!.month}/${items[index]!.year}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
