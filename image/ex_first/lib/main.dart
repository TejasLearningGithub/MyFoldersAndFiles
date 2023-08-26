import 'package:ex_first/widgets/widget_card.dart';
import 'package:ex_first/widgets/widget_banner.dart';
import 'package:ex_first/widgets/widget_colored_filter.dart';
import 'package:ex_first/widgets/widget_cupertino_segment.dart';
import 'package:ex_first/widgets/widget_custom_scroll.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Image Upload Example',
      home: MyCustomScrollWidget(),
    );
  }
}
