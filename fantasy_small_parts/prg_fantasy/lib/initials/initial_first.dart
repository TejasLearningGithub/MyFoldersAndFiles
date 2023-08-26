import 'package:flutter/material.dart';

class InitialFirst extends StatelessWidget {
  const InitialFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/login_screen_background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        //Scaffold(backgroundColor: Colors.transparent, body: Text("Hello world"))
        Container(
          constraints: BoxConstraints(
            maxHeight: 105,
            maxWidth: 405,
          ),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 50,
                    spreadRadius: 50,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                    color: Colors.black),
              ],
              // color: Colors.black,
              color: Colors.transparent),
          height: 105,
          width: 405,
        ),

        Positioned(
          top: 35,
          left: 85,
          child: Image.asset(
            'assets/logos/fantasylogo1.png',
            // fit: BoxFit.fitHeight,
            width: 224,
            height: 66,
            //fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
            top: 675,
            left: 162,
            child: Column(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Login')),
                ElevatedButton(onPressed: () {}, child: Text('Register'))
              ],
            ))
      ],
    );
  }
}
