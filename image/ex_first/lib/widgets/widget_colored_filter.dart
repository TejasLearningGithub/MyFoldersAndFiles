import 'package:flutter/material.dart';

class WidgetColoredFilter extends StatefulWidget {
  const WidgetColoredFilter({super.key});

  @override
  State<WidgetColoredFilter> createState() => _WidgetColoredFilterState();
}

class _WidgetColoredFilterState extends State<WidgetColoredFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget - ColoredFilter'),
      ),
      body: Column(
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.amber,
              BlendMode.color,
            ),
            child: Image.asset('assets/draft.png'),
          ),
        ],
      ),
    );
  }
}
