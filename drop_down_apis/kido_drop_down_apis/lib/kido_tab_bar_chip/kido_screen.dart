import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class KidoTabScreen extends StatefulWidget {
  const KidoTabScreen({super.key});

  @override
  State<KidoTabScreen> createState() => _KidoTabScreenState();
}

class _KidoTabScreenState extends State<KidoTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar'),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
