import 'package:flutter/material.dart';

class CustomTableSelf extends StatefulWidget {
  const CustomTableSelf({super.key});

  @override
  State<CustomTableSelf> createState() => _CustomTableSelfState();
}

class _CustomTableSelfState extends State<CustomTableSelf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Table'),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            const Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 32,
                    ),
                    Text('Date'),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    SizedBox(
                      width: 96,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text('Mumbai'),
                      ),
                    ),
                    Text('Chennai'),
                    Text('Delhi'),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      color: Colors.black12,
                      height: 5,
                      width: 245,
                    )
                  ],
                ),
                const Row(
                  children: [
                    Row(
                      children: [
                        Text('Borivali'),
                        Text('HO Center'),
                      ],
                    ),
                    Text('Chennai\nESTZ'),
                    SizedBox(
                      width: 22,
                    ),
                    Text('DLF\nPhase-4'),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      color: Colors.black12,
                      height: 1,
                      width: 345,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 368.0),
                  child: Column(
                    children: [
                      Text('A'),
                      Text('B'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
