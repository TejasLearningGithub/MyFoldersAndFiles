import 'package:accessing_kido_apis/ADD_LEAD/add_lead_provider.dart';
import 'package:accessing_kido_apis/ADD_LEAD/model/action_planned.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import 'ex_multi_drop_down.dart';

class AccessingUseOfDropdown extends StatefulWidget {
  const AccessingUseOfDropdown({super.key});

  @override
  State<AccessingUseOfDropdown> createState() => _AccessingUseOfDropdownState();
}

class _AccessingUseOfDropdownState extends State<AccessingUseOfDropdown> {
  late AddLeadProvider addLeadProvider;

  Future initPref() async {
    await addLeadProvider.getAllActionPlanned(
        statusId: '63b3fa85f1f372a8e4fdb0e1');
  }

  @override
  void initState() {
    super.initState();
    addLeadProvider = Provider.of<AddLeadProvider>(context, listen: false);
    initPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          actionPlanned()
        ],
      ),
    );
  }

  MultiSelectDropDown actionPlanned() {
    List<ActionPlannedModel> actionPlannedList = context.select(
      (AddLeadProvider value) => value.listOfActions,
    );
    return MultiSelectDropDown(
        itemList: actionPlannedList.map((e) => e.name!).toList(),
        isRequired: false,
        labelText: 'Select Action',
        hintText: 'Action',
        onChange: (val) {
          addLeadProvider.actionTaken = val;
        },
        initialItems:
            context.select((AddLeadProvider value) => value.actionTaken));
  }
}
