import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SearchFunctionFirst extends StatefulWidget {
  const SearchFunctionFirst({super.key});

  @override
  State<SearchFunctionFirst> createState() => _SearchFunctionFirstState();
}

class _SearchFunctionFirstState extends State<SearchFunctionFirst> {
  var filter = TextEditingController();
  List names = [];
  Widget appBarTitle = const Text('Search Example');
  Icon searchIcon = const Icon(Icons.search);
  List newFilteredList = [];
  List filteredList = [];
  var dio = Dio();
  var searchText = '';
  _SearchFunctionFirstState() {
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
          title: Text('${newFilteredList[index]['name']}'),
          subtitle: Text('${newFilteredList[index]['username']}'),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getNames();
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
        appBarTitle = const Text('Search here');
        newFilteredList = names;
        filter.clear();
      }
    });
  }

  Future getNames() async {
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

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: appBarTitle,
      leading: IconButton(
        onPressed: searchPressed,
        icon: searchIcon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(child: buildList()),
    );
  }
}
