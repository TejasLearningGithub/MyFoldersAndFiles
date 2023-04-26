import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kido_drop_down_apis/provider/center_provider.dart';
import 'package:provider/provider.dart';

class CenterDataScreen extends StatefulWidget {
  const CenterDataScreen({super.key});

  @override
  State<CenterDataScreen> createState() => _CenterDataScreenState();
}

class _CenterDataScreenState extends State<CenterDataScreen> {
  late KidoCenterProvider kidoCenterProvider;
  Future initPrefs() async {
    //await kidoCenterProvider.getCenterDataByZone();
  }

  @override
  void initState() {
    super.initState();
    kidoCenterProvider =
        Provider.of<KidoCenterProvider>(context, listen: false);
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Center Data By Zone'),
      ),
      body: Column(
        children: [
          // ElevatedButton(
          //     onPressed: () async {
          //       await kidoCenterProvider.getCenterDataByZone();
          //     },
          //     child: const Text('Press')),
          Consumer<KidoCenterProvider>(builder: (context, value, child) {
            return Text(
                value.mykidoCenterList[0].agreementTermStart ?? 'not load');
          })
        ],
      ),
    );
  }
}
