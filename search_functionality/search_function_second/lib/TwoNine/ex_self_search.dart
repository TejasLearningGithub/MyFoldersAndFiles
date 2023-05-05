import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SelfSearchExampleTwoNine extends StatefulWidget {
  const SelfSearchExampleTwoNine({super.key});

  @override
  State<SelfSearchExampleTwoNine> createState() =>
      _SelfSearchExampleTwoNineState();
}

class _SelfSearchExampleTwoNineState extends State<SelfSearchExampleTwoNine> {
  var dio = Dio();
  var filter = TextEditingController();
  List names = [];
  List filteredList = [];
  Widget appBarTitle = const Text('Search Example');
  Icon searchIcon = const Icon(Icons.search);
  var searchText = '';
  List newFilteredList = [];
  @override
  void initState() {
    super.initState();
    getNames();
  }

  _SelfSearchExampleTwoNineState() {
    filter.addListener(() {
      if (filter.text.isEmpty) {
        setState(() {
          searchText = '';
          filteredList = names;
        });
      } else {
        setState(() {
          searchText = filter.text;
        });
      }
    });
  }

  void getNames() async {
    var response = await dio.get('https://jsonplaceholder.typicode.com/users');
    List tempList = [];

    for (int i = 0; i < response.data.length; i++) {
      tempList.add(response.data[i]);
    }
    setState(() {
      names = tempList;
      newFilteredList = names;
    });
  }

  void searchPressed() {
    setState(() {
      if (searchIcon.icon == Icons.search) {
        searchIcon = const Icon(Icons.close);
        appBarTitle = TextFormField(
          controller: filter,
          decoration: const InputDecoration(
            hintText: 'Please Enter Search Terms',
          ),
        );
      } else {
        searchIcon = const Icon(Icons.search);
        appBarTitle = const Text('Search Example');
        newFilteredList = names;
        filter.clear();
      }
    });
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      title: appBarTitle,
      leading: IconButton(onPressed: searchPressed, icon: searchIcon),
    );
  }

  Widget buildList() {
    if (searchText.isNotEmpty) {
      List tempList = [];
      for (int i = 0; i < filteredList.length; i++) {
        if (filteredList[i]['name']
            .toString()
            .toLowerCase()
            .contains(searchText.toLowerCase())) {
          tempList.add(filteredList[i]);
        }
      }
      newFilteredList = tempList;
    }

    return ListView.builder(
      itemCount: names.isEmpty ? 0 : newFilteredList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(newFilteredList[index]['name']),
          subtitle: Text(newFilteredList[index]['username']),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        child: buildList(),
      ),
    );
  }
}
