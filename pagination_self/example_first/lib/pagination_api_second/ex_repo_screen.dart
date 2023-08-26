import 'dart:convert';

import 'package:example_first/pagination_api_ex/model_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondPaginationEx extends StatefulWidget {
  const SecondPaginationEx({super.key});

  @override
  State<SecondPaginationEx> createState() => _SecondPaginationExState();
}

class _SecondPaginationExState extends State<SecondPaginationEx> {
  ScrollController scrollController = ScrollController();
  List myList = [];
  List<Result> myResult = [];
  bool isLoading = true;
  int offset = 0;
  int localOffset = 0;
  fetchData(paraOffset) async {
    setState(() {
      isLoading = true;
    });
    var response = await http.get(Uri.parse(
        'https://pokeapi.co/api/v2/pokemon?offset=$paraOffset&limit=15'));
    ModelClass modelClass = ModelClass.fromJson(json.decode(response.body));
    myResult = myResult + modelClass.results;
    localOffset = offset + 15;
    setState(() {
      myResult;
      isLoading = false;
      offset = localOffset;
    });
  }

  @override
  void initState() {
    fetchData(0);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchData(offset);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagination Example'),
      ),
      body: ListView.builder(
        controller: scrollController,
        itemCount: myResult.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(myResult[index].name),
            subtitle: Text(myResult[index].url),
          );
        },
      ),
    );
  }
}
