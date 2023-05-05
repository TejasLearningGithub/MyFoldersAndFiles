import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MySelfSearch extends StatefulWidget {
  const MySelfSearch({super.key});

  @override
  State<MySelfSearch> createState() => _MySelfSearchState();
}

class _MySelfSearchState extends State<MySelfSearch> {
  var dio = Dio();
  var searchText = '';
  var names = [];
  List filteredList = [];
  var filter = TextEditingController();
  Icon searchIcon = Icon(Icons.search);
  Widget appBarTitle = Text('Search Here');

  void searchPressed() {
    if (searchIcon.icon == Icons.search) {
      setState(() {
        searchIcon = const Icon(Icons.close);
        appBarTitle = TextFormField(
          controller: filter,
          decoration: InputDecoration(hintText: 'Please Enter Search Terms'),
        );
      });
    } else {
      setState(() {
        searchIcon = const Icon(Icons.search);
        appBarTitle = const Text('Search Example');
        filteredList = names;
        filter.clear();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getNames();
  }

  _MySelfSearchState() {
    filter.addListener(() {
      if (filter.text.isEmpty) {
        setState(() {
          searchText = '';
          filteredList = names;
        });
      } else {
        setState(() {
          searchText = filter.text;
          filteredList = names;
        });
      }
    });
  }

  void getNames() async {
    var repsone = await dio.get('https://jsonplaceholder.typicode.com/users');
    List tempList = [];
    for (int i = 0; i < repsone.data.length; i++) {
      tempList.add(repsone.data[i]);
    }
    setState(() {
      names = tempList;
      filteredList = names;
    });
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
      filteredList = tempList;
    }
    return ListView.builder(
      itemCount: names.isEmpty ? 0 : filteredList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(filteredList[index]['name']),
            subtitle: Text(filteredList[index]['username']),
          ),
        );
      },
    );
  }

  buildAppBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            searchPressed();
          },
          icon: searchIcon),
      title: GestureDetector(
          onTap: () {
            searchPressed();
          },
          child: appBarTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        child: buildList(),
      ),
    );
  }
}
