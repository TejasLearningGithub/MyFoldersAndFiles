import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SearchFunctionSecond extends StatefulWidget {
  const SearchFunctionSecond({super.key});

  @override
  State<SearchFunctionSecond> createState() => _SearchFunctionSecondState();
}

class _SearchFunctionSecondState extends State<SearchFunctionSecond> {
  var filter = TextEditingController();
  Widget appBarTitle = const Text('Search here');
  Icon searchIcon = const Icon(Icons.search);
  var dio = Dio();
  var searchText = '';
  List newFilteredList = [];
  List filteredList = [];
  List names = [];

  _SearchFunctionSecondState() {
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
        appBarTitle = const Text('Search Here');
        newFilteredList = names;
        filter.clear();
      }
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

  Widget buildList() {
    if (searchText.isNotEmpty) {
      List tempList = [];
      for (int i = 0; i < filteredList.length; i++) {
        if (filteredList[i]['name']
                .toString()
                .toLowerCase()
                .contains(searchText.toLowerCase()) ||
            filteredList[i]['username']
                .toString()
                .toLowerCase()
                .startsWith(searchText)) {
          tempList.add(filteredList[i]);
        }
      }
      newFilteredList = tempList;
    } else {
      newFilteredList = names;
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
