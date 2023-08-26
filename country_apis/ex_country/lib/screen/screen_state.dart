import 'package:ex_country/provider/myProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateScreen extends StatefulWidget {
  const StateScreen({super.key});

  @override
  State<StateScreen> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  late MyProvider myProvider;

  initPrefs() async {
    await myProvider.getStatesProvider();
  }

  @override
  void initState() {
    super.initState();
    myProvider = Provider.of<MyProvider>(context, listen: false);
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data'),
      ),
      body: ListView.builder(
        itemCount: myProvider.myList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(myProvider.myList[index].name.toString()),
          );
        },
      ),
    );
  }
}
