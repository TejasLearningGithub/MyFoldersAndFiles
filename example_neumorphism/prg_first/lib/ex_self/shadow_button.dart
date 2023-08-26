import 'package:flutter/material.dart';

class MyCircularButton extends StatelessWidget {
  final IconData myIcon;
  const MyCircularButton({
    super.key,
    required this.myIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              offset: const Offset(8, 8),
              blurRadius: 10,
              spreadRadius: 1,
            ),
            // const BoxShadow(
            //   color: Colors.blue,
            //   offset: Offset(0.0, 0.0),
            //   blurRadius: 3,
            //   spreadRadius: 0,
            // ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade100,
              Colors.blue.shade200,
              Colors.grey.shade300,
              Colors.grey.shade100,
            ],
            //stops: const [0.1, 0.3, 0.8, 1],
          ),
          //image: AssetImage()
        ),
        child: Icon(
          myIcon,
          size: 35,
          color: Colors.grey,
        ),
      ),
    );
  }
}
