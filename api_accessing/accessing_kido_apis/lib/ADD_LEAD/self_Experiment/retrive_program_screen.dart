import 'package:accessing_kido_apis/ADD_LEAD/add_lead_provider.dart';
import 'package:accessing_kido_apis/ADD_LEAD/model/programs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RetriveProgram extends StatefulWidget {
  const RetriveProgram({super.key});

  @override
  State<RetriveProgram> createState() => _RetriveProgramState();
}

class _RetriveProgramState extends State<RetriveProgram> {
  late AddLeadProvider addLeadProvider;
  var prgCategoryById = TextEditingController();

  Future initPrefs() async {
    await addLeadProvider.getPrograms(catId: '');
  }

  @override
  void initState() {
    super.initState();
    addLeadProvider = Provider.of<AddLeadProvider>(context, listen: false);
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrive Programs By Program Category'),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: prgCategoryById,
            ),
            ElevatedButton(
                onPressed: () {
                  addLeadProvider.getPrograms(
                      catId: prgCategoryById.text.toString());
                },
                child: const Text('Press')),
            Consumer<AddLeadProvider>(builder: (context, value, child) {
              return Expanded(
                child: ListView.builder(
                    itemCount: value.listPrograms.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text('abc'),
                          Text(value.listPrograms[index].programName ?? 'not'),
                          Text(value.listPrograms[index].sId ?? 'not'),
                          //Text(value.myTempList[index].code.toString()),
                          //Text(value.listPrograms[index].success.toString()),
                        ],
                      );
                    }),
              );
            })
          ],
        ),
      ),
    );
  }
}
