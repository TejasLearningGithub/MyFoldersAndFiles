import 'package:flutter/material.dart';

class CustomTableSecond extends StatefulWidget {
  const CustomTableSecond({super.key});

  @override
  State<CustomTableSecond> createState() => _CustomTableSecondState();
}

class _CustomTableSecondState extends State<CustomTableSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Table'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 70,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 100.0),
                        child: Text('Mumbai'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 15,
                        ),
                        child: Text('Chennai'),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Delhi'),
                      SizedBox(
                        height: 40,
                        width: 70,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 100.0),
                        child: Text('Mumbai'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 15,
                        ),
                        child: Text('Chennai'),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Delhi'),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text('Date'),
                    Expanded(
                      child: Divider(
                        color: Colors.black12,
                        thickness: 3,
                        height: 3,
                        indent: 25,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 65,
                    ),
                    Text('Borivalli'),
                    SizedBox(
                      width: 10,
                    ),
                    Text('HO Center'),
                    SizedBox(
                      width: 25,
                    ),
                    Text('Chennai\n ESTZ'),
                    SizedBox(
                      width: 25,
                    ),
                    Text('DLF\n Phase 4'),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black12,
                        thickness: 3,
                        height: 3,
                        indent: 1,
                        endIndent: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text('01 Aug\n 2023'),
                        SizedBox(
                          height: 25,
                        ),
                        Text('02 Aug\n 2023'),
                        SizedBox(
                          height: 25,
                        ),
                        Text('03 Aug\n 2023'),
                        SizedBox(
                          height: 25,
                        ),
                        Text('04 Aug\n 2023'),
                        SizedBox(
                          height: 25,
                        ),
                        Text('05 Aug\n 2023'),
                        SizedBox(
                          height: 25,
                        ),
                        Text('06 Aug\n 2023'),
                        SizedBox(
                          height: 25,
                        ),
                        Text('07 Aug\n 2023'),
                        SizedBox(
                          height: 25,
                        ),
                        Text('08 Aug\n 2023'),
                        SizedBox(
                          height: 25,
                        ),
                        Text('Total'),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        Text('14'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('6'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 30,
                        ),
                        Text('20'),
                        SizedBox(
                          height: 45,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        Text('6'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('3'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 30,
                        ),
                        Text('9'),
                        SizedBox(
                          height: 45,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Column(
                      children: [
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 30,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Column(
                      children: [
                        Text('1'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 45,
                        ),
                        Text('0'),
                        SizedBox(
                          height: 30,
                        ),
                        Text('1'),
                        SizedBox(
                          height: 45,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
