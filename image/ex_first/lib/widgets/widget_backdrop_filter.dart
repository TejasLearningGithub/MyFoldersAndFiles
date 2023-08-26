import 'dart:ui';

import 'package:flutter/material.dart';

class WidgetBackdropFilter extends StatefulWidget {
  const WidgetBackdropFilter({super.key});

  @override
  State<WidgetBackdropFilter> createState() => _WidgetBackdropFilterState();
}

class _WidgetBackdropFilterState extends State<WidgetBackdropFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget - Backdrop Filter'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  '0' * 1010,
                  style: const TextStyle(
                    color: Colors.green,
                  ),
                ),
                Center(
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 4.0,
                        sigmaY: 4.0,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        height: 250,
                        child: const Text(
                          'Blur',
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
