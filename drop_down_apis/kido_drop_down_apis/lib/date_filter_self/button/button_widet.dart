import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
          backgroundColor: Colors.white),
      onPressed: onClicked,
      child: FittedBox(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class ButtonHeaderWidget extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onClicked;

  const ButtonHeaderWidget({
    super.key,
    required this.title,
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return HeaderWidet(
      title: title,
      child: ButtonWidget(
        text: text,
        onClicked: onClicked,
      ),
    );
  }
}

class HeaderWidet extends StatelessWidget {
  final String title;
  final Widget child;

  const HeaderWidet({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        child,
      ],
    );
  }
}
