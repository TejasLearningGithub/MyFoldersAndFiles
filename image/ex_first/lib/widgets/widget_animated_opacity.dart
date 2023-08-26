import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetAnimatedOpacity extends StatefulWidget {
  const WidgetAnimatedOpacity({super.key});

  @override
  State<WidgetAnimatedOpacity> createState() => _WidgetAnimatedOpacityState();
}

class _WidgetAnimatedOpacityState extends State<WidgetAnimatedOpacity> {
  double opacityLevel = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Opacity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(
                seconds: 2,
              ),
              child: const FlutterLogo(
                size: 50,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
                });
              },
              child: const Text(
                'Fade Logo',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
