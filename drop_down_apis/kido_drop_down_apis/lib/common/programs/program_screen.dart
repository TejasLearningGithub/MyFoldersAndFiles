import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kido_drop_down_apis/common/multi_select_dropdown.dart';
import 'package:kido_drop_down_apis/common/programs/program_modal.dart';
import 'package:kido_drop_down_apis/common/programs/program_provier.dart';
import 'package:provider/provider.dart';

class ProgramScreen extends StatefulWidget {
  const ProgramScreen({super.key});

  @override
  State<ProgramScreen> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  late ProgramProvider programProvider;
  Future initPrefs() async {
    await programProvider.getPrograms();
  }

  @override
  void initState() {
    super.initState();
    programProvider = Provider.of<ProgramProvider>(context, listen: false);
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Programs Data'),
      ),
      body: Column(
        children: [
          programs(context),
        ],
      ),
    );
  }

  MultiSelectDropDown programs(BuildContext context) {
    List<ProgramModal> programList = context.select(
      (ProgramProvider value) => value.programList,
    );
    return MultiSelectDropDown(
      initialItems: const [],
      itemList: programList.map((e) => e.programName!).toList(),
      isRequired: false,
      labelText: 'Program',
      hintText: 'Select Program',
      onChange: (val) {
        List<String> list = val
            .map(
              (e) => programList
                  .firstWhere((element) => element.programName == e)
                  .sId!,
            )
            .toList();
        log(list.toString());
        programProvider.selectedPrograms = list;
      },
    );
  }
}
