import 'package:accessing_kido_apis/get_state_by_country_id/state_modal.dart';
import 'package:accessing_kido_apis/get_state_by_country_id/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class StateScreen extends StatefulWidget {
  const StateScreen({super.key});

  @override
  State<StateScreen> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  late StateProvider stateProvider;
  bool isLoading = true;

  Future initPref() async {
    await stateProvider.getStateByCountryId();
  }

  @override
  void initState() {
    super.initState();
    stateProvider = Provider.of<StateProvider>(context, listen: false);
    initPref().then((value) => {
          setState(() {
            //isLoading = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Data From State By Country Id'),
        ),
        body: noFollowups(true));
  }

  Widget noFollowups(bool permit) {
    // int count =
    //     context.select((FollowUpProvider value) => value.noFollowupCount ?? 0);
    return Selector<StateProvider, List<StateModal>>(
      selector: (context, provider) => provider.stateList,
      builder: (context, stateList, child) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                //physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: stateList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text(stateList[index].stateName ?? ''),
                      //Text(countryList.length.toString()),
                      //Text(countryList[index].toString()),
                      //Text(countryList[index].countryName ?? 'not loaded'),
                      //Text(countryList[index].countryId.toString()),
                      //Text(countryList[index].sId.toString()),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
