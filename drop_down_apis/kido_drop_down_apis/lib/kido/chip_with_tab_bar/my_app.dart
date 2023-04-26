//This example demonstrate how tab bar works in flutter

import 'package:flutter/material.dart';
import 'package:kido_drop_down_apis/kido/chip_with_tab_bar/experiment/my_ex_second.dart';
import 'package:kido_drop_down_apis/kido/chip_with_tab_bar/first_screen.dart';
import 'package:kido_drop_down_apis/kido/chip_with_tab_bar/second_screen.dart';

class MyTabBarApp extends StatelessWidget {
  const MyTabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: const Drawer(),
          appBar: AppBar(
            actions: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    //mainAxisSize: MainAxisSize.max,
                    children: const [
                      // SizedBox(
                      //   width: 140,
                      // ),
                      Padding(
                        padding: EdgeInsets.only(right: 135, left: 50),
                        child: Text(
                          'Leads',
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.sort,
                        size: 35,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Icon(
                        Icons.filter,
                        size: 35,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Icon(
                        Icons.search,
                        size: 35,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1,
                    width: 411,
                    color: Colors.black,
                  )
                ],
              )
            ],
            backgroundColor: Colors.blue.shade900,
            //title: const Text('Leads'),
            bottom: const TabBar(
              //automaticIndicatorColorAdjustment: true,
              indicatorColor: Colors.white,
              tabs: [Tab(text: "Leads"), Tab(text: "Walk - Ins")],
            ),
          ),
          body: const TabBarView(
            children: [
              MyExampleSecond(),
              MyExampleSecond(),
            ],
          ),
        ),
      ),
    );
  }
}
