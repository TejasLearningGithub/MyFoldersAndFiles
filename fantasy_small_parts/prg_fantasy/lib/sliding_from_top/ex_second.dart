import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class HomeSlideFromTop extends StatefulWidget {
  @override
  _HomeSlideFromTopState createState() => _HomeSlideFromTopState();
}

class _HomeSlideFromTopState extends State<HomeSlideFromTop>
    with TickerProviderStateMixin {
  bool _fromTop = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showGeneralDialog(
              barrierLabel: "Label",
              barrierDismissible: true,
              barrierColor: Colors.transparent,
              transitionDuration: Duration(
                milliseconds: 700,
              ),
              context: context,
              pageBuilder: (context, anim1, anim2) {
                return GestureDetector(
                  onVerticalDragUpdate: (dragUpdateDetails) {
                    Navigator.of(context).pop();
                  },
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Card(
                        // margin:
                        //     EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Container(
                          height: 350,
                          width: double.infinity,
                          padding: EdgeInsets.all(0),
                          child: Column(
                            children: [
                              Text(
                                'My Dialog Box',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            //borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              transitionBuilder: (context, anim1, anim2, child) {
                return SlideTransition(
                  position: anim1.drive(Tween(
                          begin: Offset(0, _fromTop ? -1 : 1),
                          end: Offset(0, 0))
                      .chain(CurveTween(curve: Sprung()))),
                  child: child,
                );
              },
            );
          },
          icon: Icon(
            Icons.wallet,
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.fireplace_outlined),
      //   onPressed: () {

      //   },
      // ),
    );
  }
}

class Sprung extends Curve {
  factory Sprung([double damping = 20]) => Sprung.custom(damping: damping);

  Sprung.custom({
    double damping = 20,
    double stiffness = 180,
    double mass = 1.0,
    double velocity = 0.0,
  }) : this._sim = SpringSimulation(
          SpringDescription(
            damping: damping,
            mass: mass,
            stiffness: stiffness,
          ),
          0.0,
          1.0,
          velocity,
        );

  final SpringSimulation _sim;

  @override
  double transform(double t) => _sim.x(t) + t * (1 - _sim.x(1.0));
}
