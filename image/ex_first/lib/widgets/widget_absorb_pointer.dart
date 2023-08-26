import 'dart:developer';

import 'package:flutter/material.dart';

class AbsorbPointerWidet extends StatelessWidget {
  const AbsorbPointerWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Absorb Pointer Widget'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                  log('Blue Button Clicked');
                },
                child: null,
              ),
            ),
            SizedBox(
              width: 100,
              height: 200,
              child: AbsorbPointer(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    log('Green Button Clicked');
                  },
                  child: null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
