import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  var icon;

  MyButton({
    Key? key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
          boxShadow: [
            BoxShadow(
              color: Colors.grey[600]!,
              offset: const Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
            const BoxShadow(
                color: Colors.white,
                offset: Offset(-4.0, -4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey[200]!,
              Colors.grey[300]!,
              Colors.grey[400]!,
              Colors.grey[500]!,
            ],
            stops: const [0.1, 0.3, 0.8, 1],
          ),
        ),
        child: Icon(
          icon,
          size: 37,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
