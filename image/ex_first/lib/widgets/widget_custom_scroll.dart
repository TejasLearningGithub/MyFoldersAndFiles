import 'package:flutter/material.dart';

class MyCustomScrollWidget extends StatefulWidget {
  const MyCustomScrollWidget({super.key});

  @override
  State<MyCustomScrollWidget> createState() => _MyCustomScrollWidgetState();
}

class _MyCustomScrollWidgetState extends State<MyCustomScrollWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Scroll View'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                alignment: Alignment.topLeft,
                color: Colors.orange[100 * (index % 9)],
                child: Text('Grid Item = $index'),
              ),
              childCount: 50,
            ),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 50,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
