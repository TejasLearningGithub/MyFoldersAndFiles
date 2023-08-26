import 'package:flutter/material.dart';

class WidgetCustomPaint extends StatelessWidget {
  const WidgetCustomPaint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Paint'),
      ),
      body: Column(
        children: [
          Center(
            child: CustomPaint(
              child: Text(
                'This is pac-man',
                style: TextStyle(
                  backgroundColor: Colors.white,
                  color: Colors.green,
                  fontSize: 30,
                ),
              ),
              painter: DemoPointer(),
            ),
          )
        ],
      ),
    );
  }
}

class DemoPointer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
  
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
