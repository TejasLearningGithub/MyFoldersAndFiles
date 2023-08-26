import 'dart:convert';
import 'dart:developer';

import 'package:example_first/Pagination/mock_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MockApiScreen extends StatefulWidget {
  const MockApiScreen({super.key});

  @override
  State<MockApiScreen> createState() => _MockApiScreenState();
}

class _MockApiScreenState extends State<MockApiScreen> {
  ScrollController scrollController = ScrollController();
  List myMockData = [];
  List<MockModel> myList = [];
  int currentPage = 1;
  bool isLoading = true;
  fetchData(page) async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await http.get(Uri.parse(
          'https://5b5cb0546a725000148a67ab.mockapi.io/api/v1/users?page=$page&limit=12'));
      // MockModel mockModel = MockModel.fromJson(json.decode(response.body));
      myMockData = jsonDecode(response.body);
      List<MockModel> myData =
          myMockData.map((e) => MockModel.fromJson(e)).toList();
      setState(() {
        myList = myList + myData;
      });
      log('Total Number Of Records = ${myList.length}');
    } catch (e) {
      log('Error = ${e.toString()}');
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchData(1);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        // if (myList.isNotEmpty) {
        log('previous = ${currentPage.toString()}');
        currentPage = currentPage + 1;
        log('next = ${currentPage.toString()}');
        // }
        fetchData(currentPage);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Self Pagination Using Mock Api'),
      ),
      body: Stack(children: [
        ListView.separated(
          controller: scrollController,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(myList[index].id),
              subtitle: Text(myList[index].name),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 1,
            );
          },
          itemCount: myList.length,
        ),
        if (isLoading) ...[
          const Positioned(
            left: 0,
            bottom: 0,
            child: SizedBox(
              width: 400,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              ),
            ),
          ),
        ]
      ]),
    );
  }
}
