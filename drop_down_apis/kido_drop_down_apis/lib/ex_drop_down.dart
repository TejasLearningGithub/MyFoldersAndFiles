import 'package:flutter/material.dart';
import 'package:kido_drop_down_apis/common/search_dropdown.dart';
import 'package:kido_drop_down_apis/model/center_modal.dart';
import 'package:kido_drop_down_apis/model/country_model.dart';
import 'package:kido_drop_down_apis/model/zone_modal.dart';
import 'package:kido_drop_down_apis/provider/center_provider.dart';
import 'package:kido_drop_down_apis/provider/country_provider.dart';
import 'package:kido_drop_down_apis/provider/zone_provider.dart';
import 'package:provider/provider.dart';

class AccessingKidoApisDropdown extends StatefulWidget {
  const AccessingKidoApisDropdown({super.key});

  @override
  State<AccessingKidoApisDropdown> createState() =>
      _AccessingKidoApisDropdownState();
}

class _AccessingKidoApisDropdownState extends State<AccessingKidoApisDropdown> {
  late CountryProvider countryProvider;
  late ZoneProvider zoneProvider;
  late KidoCenterProvider kidoCenterProvider;
  final GlobalKey<FormFieldState> countryDropdownKey = GlobalKey();
  final GlobalKey<FormFieldState> zoneDropdownKey = GlobalKey();
  final GlobalKey<FormFieldState> centerDropdownKay = GlobalKey();
  initPrefs() async {
    await countryProvider.getCountriesData();
    await zoneProvider.getZoneData(countryId: '');
    await kidoCenterProvider.getCenterDataByZone(zoneId: '');
  }

  @override
  void initState() {
    super.initState();
    countryProvider = Provider.of<CountryProvider>(context, listen: false);
    zoneProvider = Provider.of<ZoneProvider>(context, listen: false);
    kidoCenterProvider =
        Provider.of<KidoCenterProvider>(context, listen: false);
    initPrefs();
    //context.read<CountryProvider>().getCountriesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessing Dropdown APIs'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            country(context),
            const SizedBox(
              height: 50,
            ),
            zone(context),
            const SizedBox(
              height: 50,
            ),
            center(context),
          ],
        ),
      ),
    );
  }

  SearchDropDown country(BuildContext context) {
    List<CountryModel> countryList = context.select(
      (CountryProvider value) {
        return value.countryList;
      },
    );

    var items = countryList.map<MenuItem>(
      (e) {
        return MenuItem(
          value: e.sId!,
          display: e.countryName!,
          code: e.countryId,
        );
      },
    );
    return SearchDropDown(
        dropDownKey: countryDropdownKey,
        hintText: 'Please Select Country',
        onChanged: (val) {
          zoneDropdownKey.currentState!.reset();
          zoneProvider.getZoneData(countryId: val.value);
        },
        items: items.toList());
  }

  SearchDropDown zone(BuildContext context) {
    List<ZoneModal> zoneList =
        context.select((ZoneProvider value) => value.zoneModalList);

    var items = zoneList.map<MenuItem>((e) {
      return MenuItem(
        value: e.sId!,
        display: e.name!,
      );
    });
    return SearchDropDown(
        dropDownKey: zoneDropdownKey,
        hintText: 'Please Select Zone',
        onChanged: (val) {
          centerDropdownKay.currentState!.reset();
          kidoCenterProvider.getCenterDataByZone(zoneId: val.value);
        },
        items: items.toList());
  }

  SearchDropDown center(BuildContext context) {
    List<CenterModal> kidoCenterList =
        context.select((KidoCenterProvider value) {
      return value.centerList;
    });
    var items = kidoCenterList.map<MenuItem>((e) {
      return MenuItem(
        value: e.sId!,
        display: e.schoolName!,
        code: e.code,
      );
    });
    return SearchDropDown(
        dropDownKey: centerDropdownKay,
        hintText: 'Please Select Center',
        onChanged: (val) {},
        items: items.toList());
  }

  
}
