import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SelfSearchFunction extends StatefulWidget {
  const SelfSearchFunction({super.key});

  @override
  State<SelfSearchFunction> createState() => _SelfSearchFunctionState();
}

class _SelfSearchFunctionState extends State<SelfSearchFunction> {
  var filter = TextEditingController();
  var dio = Dio();
  String searchText = '';
  List names = [];
  List filteredNames = [];
  Icon searchIcon = const Icon(Icons.search);
  Widget appBarTitle = const Text('Search Example');

  _SelfSearchFunctionState() {
    filter.addListener(() {
      if (filter.text.isEmpty) {
        setState(() {
          searchText = '';
          filteredNames = names;
        });
      } else {
        setState(() {
          searchText = filter.text;
        });
      }
    });
  }

  void getNames() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/users');
    List tempList = [];
    for (int i = 0; i < response.data.length; i++) {
      tempList.add(response.data[i]);
    }
    setState(() {
      names = tempList;
      filteredNames = names;
    });
  }

  void searchPressed() {
    setState(() {
      if (searchIcon.icon == Icons.search) {
        searchIcon = const Icon(Icons.close);
        appBarTitle = TextField(
          controller: filter,
          decoration: const InputDecoration(
              hintText: 'search.....', prefixIcon: Icon(Icons.search)),
        );
      } else {
        searchIcon = const Icon(Icons.search);
        appBarTitle = const Text('Search Example');
        filteredNames = names;
        filter.clear();
      }
    });
  }

  Widget buildList() {
    if (searchText.isNotEmpty) {
      List tempList = [];
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name']
                .toLowerCase()
                .contains(searchText.toLowerCase()) ||
            filteredNames[i]['username']
                .toLowerCase()
                .contains(searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
        itemCount: names.isEmpty ? 0 : filteredNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredNames[index]['name']),
            subtitle: Text(filteredNames[index]['username']),
          );
        });
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: appBarTitle,
      leading: IconButton(onPressed: searchPressed, icon: searchIcon),
    );
  }

  @override
  void initState() {
    getNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        child: buildList(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
