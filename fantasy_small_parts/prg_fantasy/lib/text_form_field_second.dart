import 'package:flutter/material.dart';

class ParentTextFormWidget extends StatefulWidget {
  const ParentTextFormWidget({super.key});

  @override
  _ParentTextFormWidgetState createState() => _ParentTextFormWidgetState();
}

class _ParentTextFormWidgetState extends State<ParentTextFormWidget> {
  int _counter = 0;
  String _text = 'no taps yet';
  var _controller = TextEditingController(text: 'initial value');

  void _handleTap() {
    setState(() {
      _counter = _counter + 1;
      _text = 'number of taps: ' + _counter.toString();
      _controller.text = 'number of taps: ' + _counter.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        SizedBox(
          height: 50,
        ),
        TextButton(
          onPressed: _handleTap,
          child: const Text('Tap me', style: TextStyle(fontSize: 20)),
        ),
        Text('$_text'),
        TextField(
          controller: _controller,
        ),
      ]),
    );
  }
}
