import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DoSearchSelf extends StatefulWidget {
  const DoSearchSelf({super.key});

  @override
  State<DoSearchSelf> createState() => _DoSearchSelfState();
}

class _DoSearchSelfState extends State<DoSearchSelf> {
  //List nameList = []7;
  List names = [];
  List filteredNames = [];
  var dio = Dio();
  var filter = TextEditingController();
  Icon searchIcon = const Icon(Icons.search);
  Widget appBarTitle = const Text('Search Example');
  var searchText = '';

  _DoSearchSelfState() {
    filter.addListener(() {
      if (filter.text.isEmpty) {
        setState(() {
          searchText = '';
          filteredNames = names;
        });
      } else {
        setState(() {
          searchText = filter.text;
          //names = searchText as List;
          filteredNames = names;
        });
      }
    });
  }

  buildAppBar(BuildContext context) {
    return AppBar(
        title: appBarTitle,
        leading: IconButton(onPressed: searchPressed, icon: searchIcon));
  }

  void searchPressed() {
    setState(() {
      if (searchIcon.icon == Icons.search) {
        searchIcon = const Icon(Icons.close);
        appBarTitle = TextFormField(
          controller: filter,
          decoration:
              const InputDecoration(hintText: 'Please Enter Search Terms'),
        );
      } else {
        searchIcon = const Icon(Icons.search);
        appBarTitle = const Text('Search Example');

        filteredNames = names;
        filter.clear();
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
      filteredNames = names;
    });
  }

  Widget buildList() {
    if (searchText.isNotEmpty) {
      List tempList = [];
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name']
            .toString()
            .toLowerCase()
            .contains(searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
        // = tempList;
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
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getNames();
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
