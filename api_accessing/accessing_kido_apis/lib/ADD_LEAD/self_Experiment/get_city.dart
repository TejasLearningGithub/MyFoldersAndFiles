import 'package:accessing_kido_apis/ADD_LEAD/add_lead_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class GetCities extends StatefulWidget {
  final int myId;
  const GetCities({super.key, required this.myId});

  @override
  State<GetCities> createState() => _GetCitiesState();
}

class _GetCitiesState extends State<GetCities> {
  late AddLeadProvider addLeadProvider;

  Future initPrefs() async {
    await addLeadProvider.getCities(stateId: widget.myId);
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
        title: Text('Get City On Click'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<AddLeadProvider>(builder: (context, value, index) {
              return SizedBox(
                height: 550,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: value.cityList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(value.cityList[index].cityName ?? 'ABC')
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
