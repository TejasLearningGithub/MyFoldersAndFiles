import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dropdownSearch Demo',
      //enable this line if you want test Dark Mode
      //theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<int>>();
  final _multiKey = GlobalKey<DropdownSearchState<String>>();
  final _popupBuilderKey = GlobalKey<DropdownSearchState<String>>();
  final _popupCustomValidationKey = GlobalKey<DropdownSearchState<int>>();
  final _userEditTextController = TextEditingController(text: 'Mrs');
  //final myKey = GlobalKey<DropdownSearchState<MultiLevelString>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Searchable Dropdown'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: DropdownSearch<int>(
                items: List.generate(50, (i) => i),
                popupProps: PopupProps.menu(
                  title: Text('With fit to loose and no constraints'),
                  showSearchBox: true,
                  fit: FlexFit.tight,
                  //comment this if you want that the items do not takes all available height
                  constraints: BoxConstraints.tightFor(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
