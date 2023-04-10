import 'package:accessing_kido_apis/ADD_LEAD/add_lead_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class GetCitiesByState extends StatefulWidget {
  const GetCitiesByState({super.key});

  @override
  State<GetCitiesByState> createState() => _GetCitiesByStateState();
}

class _GetCitiesByStateState extends State<GetCitiesByState> {
  var cityController = TextEditingController();
  late AddLeadProvider addLeadProvider;
  @override
  void initState() {
    super.initState();
    addLeadProvider = Provider.of<AddLeadProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Cities By State'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: cityController,
            ),
            ElevatedButton(
                onPressed: () {
                  addLeadProvider.getCities(
                      stateId: int.parse(cityController.text.toString()));
                },
                child: Text('Get Cities')),
            Consumer<AddLeadProvider>(builder: (context, value, child) {
              return SizedBox(
                height: 500,
                width: double.maxFinite,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.cityList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(value.cityList[index].cityName ?? 'ABC'),
                          Text(value.cityList[index].citySlug ?? ''),
                          Text(value.cityList[index].stateId.toString()),
                          Text('===========================================')
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
