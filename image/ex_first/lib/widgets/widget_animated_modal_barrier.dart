import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetAnimatedModalBarrier extends StatefulWidget {
  const WidgetAnimatedModalBarrier({super.key});

  @override
  State<WidgetAnimatedModalBarrier> createState() =>
      _WidgetAnimatedModalBarrierState();
}

class _WidgetAnimatedModalBarrierState extends State<WidgetAnimatedModalBarrier>
    with SingleTickerProviderStateMixin {
  bool isPressed = false;
  late Widget animatedModalBarrier;
  late AnimationController animationController;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    ColorTween colorTween = ColorTween(
      begin: Colors.orangeAccent.withOpacity(0.5),
      end: Colors.blueGrey.withOpacity(0.5),
    );

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    colorAnimation = colorTween.animate(animationController);
    animatedModalBarrier = AnimatedModalBarrier(
      color: colorAnimation,
      dismissible: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Modal Barrier')),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 250,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        isPressed = true;
                      });
                      animationController.reset();
                      animationController.forward();
                      Future.delayed(
                          const Duration(
                            seconds: 3,
                          ), () {
                        setState(() {
                          isPressed = false;
                        });
                      });
                    },
                    child: const Text('Press'),
                  ),
                  if (isPressed) animatedModalBarrier
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
