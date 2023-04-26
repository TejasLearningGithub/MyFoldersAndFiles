import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kido_drop_down_apis/filter_functionality/mock_apis/model/person.dart';
import 'package:kido_drop_down_apis/filter_functionality/mock_apis/provider/person_provider.dart';
import 'package:provider/provider.dart';

class PersonList extends StatefulWidget {
  const PersonList({super.key});

  @override
  State<PersonList> createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  late PersonProvider personProvider;
  bool isSearching = false;
  List names = [];
  List filteredNames = [];
  Future initPrefs() async {
    await personProvider.getPersonData();
  }

  @override
  void initState() {
    super.initState();
    personProvider = Provider.of<PersonProvider>(context, listen: false);
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: !isSearching
            ? const Text('All Countries')
            : TextField(
                onChanged: (value) {
                  personProvider.filterCountries(value);
                },
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Search Country Here",
                    hintStyle: TextStyle(color: Colors.white)),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                      filteredNames = names;
                    });
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<PersonProvider>(builder: (context, value, child) {
              return SizedBox(
                  height: 450,
                  width: double.maxFinite,
                  child: value.filteredList.isNotEmpty
                      ? ListView.builder(
                          itemCount: value.filteredList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: SizedBox(
                                height: 70,
                                child: Column(
                                  children: [
                                    Text(value.filteredList[index].firstName ??
                                        '')
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : const CircularProgressIndicator());

              //return const CircularProgressIndicator();
            })
          ],
        ),
      ),
    );
  }
}
