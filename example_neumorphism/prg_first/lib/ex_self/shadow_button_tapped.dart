import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ShadowButtonTapped extends StatelessWidget {
  final IconData myIcon;
  const ShadowButtonTapped({
    super.key,
    required this.myIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            offset: Offset(2.0, 2.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-2.0, -2.0),
            blurRadius: 15,
            spreadRadius: 1.0,
          ),
        ],
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade200,
            Colors.blue.shade300,
            Colors.blue.shade400,
            Colors.blue.shade500,
          ],
          stops: const [
            0.0,
            0.3,
            0.8,
            0.1,
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset(2, 2),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.blue,
              offset: Offset(-2, -2),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue.shade700,
              Colors.blue.shade600,
              Colors.white,
              Colors.grey,
            ],
            stops: const [
              0,
              0.0,
              0.0,
              1,
            ],
          ),
        ),
        child: Icon(
          myIcon,
          size: 35,
          color: Colors.cyan,
        ),
      ),
    );
  }
}
