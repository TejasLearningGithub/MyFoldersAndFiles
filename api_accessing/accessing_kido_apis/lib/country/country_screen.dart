import 'package:accessing_kido_apis/country/country_model.dart';
import 'package:accessing_kido_apis/country/country_provider.dart';
import 'package:accessing_kido_apis/model/country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  late CountryProvider countryProvider;
  bool isLoading = false;
  Future initPrefs() async {
    await countryProvider.getCountries();
  }

  @override
  void initState() {
    super.initState();
    countryProvider = Provider.of<CountryProvider>(context, listen: false);
    initPrefs().then((value) => {
          setState(() {
            isLoading = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Accessing Country Apis'),
        ),
        body: noFollowups(false));
  }

  Widget noFollowups(bool permit) {
    // int count =
    //     context.select((FollowUpProvider value) => value.noFollowupCount ?? 0);
    return Selector<CountryProvider, List<CountryModal>>(
      selector: (context, provider) => provider.countryList,
      builder: (context, countryList, child) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                //physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: countryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Text('ABC'),
                      //Text(countryList.length.toString()),
                      //Text(countryList[index].toString()),
                      Text(countryList[index].countryName ?? 'not loaded'),
                      Text(countryList[index].countryId.toString()),
                      Text(countryList[index].sId.toString()),
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
