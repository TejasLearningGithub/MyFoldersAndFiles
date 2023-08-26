import 'package:flutter/material.dart';

class WidgetClipPath extends StatefulWidget {
  const WidgetClipPath({super.key});

  @override
  State<WidgetClipPath> createState() => _WidgetClipPathState();
}

class _WidgetClipPathState extends State<WidgetClipPath> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget - clippath'),
      ),
      body: Center(
        child: ClipPath(
          clipper: CustomClipPath(),
          child: Container(
            width: 200,
            height: 200,
            //color: Colors.amber,
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 15.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(115, 115);
    // path.lineTo(size.width, 0);
    // path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
