import 'package:flutter/material.dart';

class ButtonTapped extends StatelessWidget {
  var icon;

  ButtonTapped({
    Key? key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
          border: Border.all(
            width: 3.1,
            color: Colors.purple,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[600]!,
                offset: const Offset(4.0, 4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
            const BoxShadow(
                color: Colors.white,
                offset: Offset(-4.0, -4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
          ],
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [
          //     Colors.blue[200]!,
          //     Colors.blue[300]!,
          //     Colors.blue[400]!,
          //     Colors.blue[500]!,
          //   ],
          //   stops: const [0, 0.3, 0.8, 15],
          // ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 3.5,
            ),
            shape: BoxShape.circle,
            // color: Colors.grey[300],

            boxShadow: [
              // const BoxShadow(
              //     //color: Colors.white,
              //     color: Colors.blue,
              //     offset: Offset(4.0, 4.0),
              //     blurRadius: 15.0,
              //     spreadRadius: 1.0),
              //************************************* */
              // BoxShadow(
              //     color: Colors.blue[600]!,
              //     offset: const Offset(-4.0, -4.0),
              //     blurRadius: 15.0,
              //     spreadRadius: 1.0),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue[700]!,
                Colors.green[600]!,
                Colors.yellow[500]!,
                Colors.orange[700]!,
                Colors.red[200]!,
                Colors.red[300]!
              ],
              stops: const [0.1, 0.2, 0.3, 0.4, 0.5, 0.3],
            ),
          ),
          child: Icon(
            icon,
            size: 35,
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
