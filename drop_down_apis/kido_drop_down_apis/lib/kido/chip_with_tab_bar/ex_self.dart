//AppBar Shadow Effect

import 'package:flutter/material.dart';

class MyAppBarShadowEffect extends StatefulWidget {
  const MyAppBarShadowEffect({super.key});

  @override
  State<MyAppBarShadowEffect> createState() => _MyAppBarShadowEffectState();
}

class _MyAppBarShadowEffectState extends State<MyAppBarShadowEffect> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Material(
              elevation: 4, // set the elevation to a value greater than 0
              child: TabBar(
                tabs: [
                  Tab(text: 'Tab 1'),
                  Tab(text: 'Tab 2'),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Container(child: Text('Tab 1')),
              Container(child: Text('Tab 2')),
            ],
          ),
        ),
      ),
    );
  }
}
