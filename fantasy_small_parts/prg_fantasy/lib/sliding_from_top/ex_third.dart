import 'package:flutter/material.dart';
import 'package:prg_fantasy/sliding_from_top/ex_second.dart';

class SlidingFromTop extends StatefulWidget {
  const SlidingFromTop({super.key});

  @override
  State<SlidingFromTop> createState() => _SlidingFromTopState();
}

class _SlidingFromTopState extends State<SlidingFromTop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   PageRouteBuilder(
              //     opaque: false,
              //     pageBuilder: (BuildContext context, _, __) {
              //       return HomeSlideFromTop();
              //     },
              //   ),

              //);
              Navigator.of(context)
                  .overlay!
                  .insert(OverlayEntry(builder: (BuildContext context) {
                return HomeSlideFromTop();
              }));
            },
            icon: const Icon(Icons.wallet)),
      ),
    );
  }
}
