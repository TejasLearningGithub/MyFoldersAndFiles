import 'package:accessing_kido_apis/ADD_LEAD/add_lead_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class KidoStateScreen extends StatefulWidget {
  const KidoStateScreen({super.key});

  @override
  State<KidoStateScreen> createState() => _KidoStateScreenState();
}

class _KidoStateScreenState extends State<KidoStateScreen> {
  late AddLeadProvider addLeadProvider;

  Future initPrefs() async {
    await addLeadProvider.getStates(countryId: 103);
  }

  @override
  void initState() {
    super.initState();
    addLeadProvider = Provider.of<AddLeadProvider>(context, listen: false);
    //initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('States Data'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                addLeadProvider.getStates(countryId: 103);
              },
              child: Text('Get States')),
          Consumer<AddLeadProvider>(builder: (context, value, index) {
            return Expanded(
              child: ListView.builder(
                  itemCount: value.stateList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(value.stateList[index].stateName ?? 'not')
                      ],
                    );
                  }),
            );
          })
        ],
      ),
    );
  }
}
