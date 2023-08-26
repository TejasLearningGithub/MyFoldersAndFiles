import 'package:accessing_kido_apis/ADD_LEAD/add_lead_provider.dart';
import 'package:accessing_kido_apis/ADD_LEAD/model/center_modal.dart';
import 'package:accessing_kido_apis/ADD_LEAD/model/city.dart';
import 'package:accessing_kido_apis/ADD_LEAD/model/country.dart';
import 'package:accessing_kido_apis/ADD_LEAD/model/state_modal.dart';
import 'package:accessing_kido_apis/ADD_LEAD/self_Experiment/menu_item.dart';
import 'package:accessing_kido_apis/ADD_LEAD/widget/search_drop_down.dart';
import 'package:accessing_kido_apis/ADD_LEAD/widget/search_drop_down_self.dart';
import 'package:accessing_kido_apis/country/country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class DependentDropdown extends StatefulWidget {
  const DependentDropdown({super.key});

  @override
  State<DependentDropdown> createState() => _DependentDropdownState();
}

class _DependentDropdownState extends State<DependentDropdown> {
  List<CenterModal> centerList = [];
  final GlobalKey<FormFieldState> countryKey = GlobalKey();
  final GlobalKey<FormFieldState> stateKey = GlobalKey();
  final GlobalKey<FormFieldState> cityKey = GlobalKey();
  late AddLeadProvider addLeadProvider;

  Future initPrefs() async {
    await addLeadProvider.getCenters();
    await addLeadProvider.getCountries();
  }

  @override
  void initState() {
    super.initState();
    addLeadProvider = Provider.of(context, listen: false);
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormFieldState> myCenterKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: Text('Dependent Dropdown'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            selectCenter(),
            SizedBox(
              height: 25,
            ),
            selectCountry(),
            selectState(),
            selectCity(),
          ],
        ),
      ),
    );
  }

  Padding selectCenter() {
    List<CenterModal> centerList = context.select(
      (AddLeadProvider value) => value.centerList,
    );

    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Select Center :",
            ),
            SearchDropDown(
              items: centerList.map<MenuItem>((val) {
                return MenuItem(value: val.sId!, display: val.schoolName!);
              }).toList(),
              hintText: "Select Center",
              onChanged: (val) {
                addLeadProvider.schoolId = val.value;
                addLeadProvider.programCatagoryId = null;
                addLeadProvider.programId = null;
                //programKey.currentState!.reset();
                //programCatKey.currentState!.reset();
                //addLeadProvider.getProgramCatagory(val.value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding selectCountry() {
    List<IndiaCountryModal> countryList = context.select(
      (AddLeadProvider value) => value.countryList,
    );
    return Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Select Country :",
              ),
              SearchDropDown(
                  dropDownKey: countryKey,
                  hintText: 'Plese Select Country',
                  onChanged: (val) {
                    stateKey.currentState?.reset();
                    cityKey.currentState?.reset();
                    addLeadProvider.parentCountry = val.value;
                    addLeadProvider.getStates(countryId: val.code!);
                  },
                  items: countryList.map<MenuItem>((value) {
                    return MenuItem(
                      value: value.sId!,
                      display: value.countryName!,
                      code: value.countryId,
                    );
                  }).toList())
            ],
          ),
        ));
  }

  SearchDropDown selectState() {
    List<StateByCountryId> stateList = context.select(
      (AddLeadProvider value) => value.stateList,
    );

    return SearchDropDown(
        dropDownKey: stateKey,
        hintText: 'Please Select State',
        onChanged: (val) {
          addLeadProvider.parentState = val.value;
          countryKey.currentState?.reset();
          cityKey.currentState?.reset();
          addLeadProvider.getCities(stateId: int.parse(val.code.toString()));
        },
        items: stateList.map<MenuItem>((val) {
          return MenuItem(
            value: val.sId!,
            display: val.stateName!,
            code: val.id,
          );
        }).toList());
  }

  MySearchDropdownSelf selectCity() {
    List<CitiesByState> cityList = context.select(
      (AddLeadProvider value) => value.cityList,
    );

    return MySearchDropdownSelf(
        dropDownKey: cityKey,
        hintText: 'Please Select City',
        onChanged: (val) {
          addLeadProvider.parentCity = val.value;
        },
        items: cityList.map<MenuItem>((val) {
          return MenuItem(value: val.sId!, display: val.cityName!);
        }).toList());
  }
}
