import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prg_fantasy/components/drop_down_component.dart';

class ScreenDropDown extends StatefulWidget {
  const ScreenDropDown({super.key});

  @override
  State<ScreenDropDown> createState() => _ScreenDropDownState();
}

class _ScreenDropDownState extends State<ScreenDropDown> {
  List listToSearch = [
    {'name': 'Amir', 'class': 12},
    {'name': 'Raza', 'class': 11},
    {'name': 'Praksh', 'class': 10},
    {'name': 'Nikhil', 'class': 9},
    {'name': 'Sandeep', 'class': 8},
    {'name': 'Tazeem', 'class': 7},
    {'name': 'Najaf', 'class': 6},
    {'name': 'Izhar', 'class': 5},
  ];
  var selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown'),
      ),
      body: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: CustomSearchableDropDown(
              // padding: EdgeInsets.only(left: 10, right: 10),
              menuMode: true,
              items: listToSearch,
              label: 'Select Name',
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              //prefixIcon: Icon(Icons.search),
              suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
              dropDownMenuItems: listToSearch.map((item) {
                return item['name'];
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  selected = value['class'].toString();
                } else {
                  selected = null;
                }
              },
              hideSearch: false,
              searchBarHeight: 50,
              multiSelect: false,
              menuPadding: EdgeInsets.only(left: 10, right: 10),
              
            ),
          ),
        ],
      ),
    );
  }
}
