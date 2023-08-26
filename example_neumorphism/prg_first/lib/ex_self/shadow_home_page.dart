import 'package:flutter/material.dart';
import 'package:prg_first/ex_self/shadow_button.dart';
import 'package:prg_first/ex_self/shadow_button_tapped.dart';

class ShadowHomePage extends StatefulWidget {
  const ShadowHomePage({super.key});

  @override
  State<ShadowHomePage> createState() => _ShadowHomePageState();
}

class _ShadowHomePageState extends State<ShadowHomePage> {
  var icon1 = Icons.home;
  var icon2 = Icons.settings;
  var icon3 = Icons.favorite;
  var icon4 = Icons.message;

  bool buttonPressedFirst = false;
  bool buttonPressedSecond = false;
  bool buttonPressedThird = false;
  bool buttonPressedFourth = false;

  void letsPressFirst() {
    setState(() {
      buttonPressedFirst = true;
      buttonPressedSecond = false;
      buttonPressedThird = false;
      buttonPressedFourth = false;
    });
  }

  void letsPressSecond() {
    setState(() {
      buttonPressedFirst = false;
      buttonPressedSecond = true;
      buttonPressedThird = false;
      buttonPressedFourth = false;
    });
  }

  void letsPressThird() {
    setState(() {
      buttonPressedFirst = false;
      buttonPressedSecond = false;
      buttonPressedThird = true;
      buttonPressedFourth = false;
    });
  }

  void letsPressourth() {
    setState(() {
      buttonPressedFirst = false;
      buttonPressedSecond = false;
      buttonPressedThird = false;
      buttonPressedFourth = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Shadow Effects'),
      ),
      body: Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
              right: 18,
              top: 35,
              bottom: 25,
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: letsPressFirst,
                    child: buttonPressedFirst
                        ? ShadowButtonTapped(
                            myIcon: icon1,
                          )
                        : MyCircularButton(
                            myIcon: icon1,
                          ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: letsPressSecond,
                    child: buttonPressedSecond
                        ? ShadowButtonTapped(
                            myIcon: icon2,
                          )
                        : MyCircularButton(
                            myIcon: icon2,
                          ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: letsPressThird,
                    child: buttonPressedThird
                        ? ShadowButtonTapped(
                            myIcon: icon3,
                          )
                        : MyCircularButton(
                            myIcon: icon3,
                          ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: letsPressourth,
                    child: buttonPressedFourth
                        ? ShadowButtonTapped(
                            myIcon: icon4,
                          )
                        : MyCircularButton(
                            myIcon: icon4,
                          ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
