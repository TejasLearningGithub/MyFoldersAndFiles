import 'package:accessing_kido_apis/ADD_LEAD/add_lead_provider.dart';
import 'package:accessing_kido_apis/ADD_LEAD/self_Experiment/get_city.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class GetCityOnClick extends StatefulWidget {
  const GetCityOnClick({super.key});

  @override
  State<GetCityOnClick> createState() => _GetCityOnClickState();
}

class _GetCityOnClickState extends State<GetCityOnClick> {
  late AddLeadProvider addLeadProvider;
  var stateController = TextEditingController();
  Future initPref() async {
    await addLeadProvider.getStates(countryId: 103);
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
        title: Text('Get Cities By Click'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<AddLeadProvider>(builder: (context, value, child) {
              return SizedBox(
                height: 550,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: value.stateList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                print('Pressed');
                                print(value.stateList[index].id.toString());
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GetCities(
                                      myId: int.parse(
                                        value.stateList[index].id.toString(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                  value.stateList[index].stateName ?? 'ABC'))
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
