import 'package:flutter/material.dart';

class WidgetAnimatedIcon extends StatefulWidget {
  const WidgetAnimatedIcon({super.key});

  @override
  State<WidgetAnimatedIcon> createState() => _WidgetAnimatedIconState();
}

class _WidgetAnimatedIconState extends State<WidgetAnimatedIcon>
    with SingleTickerProviderStateMixin {
  bool isPlay = false;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Demo Animated Icon'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              if (isPlay == false) {
                setState(() {
                  animationController.forward();
                  isPlay = true;
                });
              } else {
                setState(() {
                  animationController.reverse();
                  isPlay = false;
                });
              }
            },
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: animationController,
              size: 100,
              color: isPlay ? Colors.blue : Colors.green,
            ),
          ),
        ));
  }
}
