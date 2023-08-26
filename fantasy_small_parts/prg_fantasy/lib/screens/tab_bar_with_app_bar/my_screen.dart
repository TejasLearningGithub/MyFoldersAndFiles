import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prg_fantasy/components/app_bar_with_tab_bar.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: TabsScreen(),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            child: Text('Screen 1'),
          ),
          Container(
            child: Text('Screen 2'),
          ),
        ],
      ),
    );
  }
}
