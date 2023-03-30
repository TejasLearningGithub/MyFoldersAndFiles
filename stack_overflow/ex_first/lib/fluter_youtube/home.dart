import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List json = [];
  List post = [];
  var scrollController = ScrollController();
  int page = 1;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    fetchPosts();
  }

  void _scrollListener() {
    print('I AM SCROLLING');
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      print('Call');
      page = page + 1;
      fetchPosts();
    } else {
      print('Don\'t call');
    }
//fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagination '),
      ),
      body: SingleChildScrollView(
        //controller: scrollController,
        child: SizedBox(
          height: 350,
          width: double.maxFinite,
          child: ListView.builder(
              controller: scrollController,
              itemCount: post.length,
              itemBuilder: (context, index) {
                //final myPosts = post[index];
                //final title = myPosts['title']['rendered'];
                //final description = myPosts['seoDescripion'];

                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(post[index]['id'].toString()),
                  //subtitle: Text(post[index]['guid']['rendered']),
                );
              }),
        ),
      ),
    );
  }

  Future<void> fetchPosts() async {
    var url =
        'https://techcrunch.com/wp-json/wp/v2/posts?context=embed&per_page=10&page=$page';
    print(url);
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      json = jsonDecode(response.body);
      setState(() {
        post = json + post;
      });
      print('It Works');
    } else {
      print('Error = ${response.statusCode}');
    }
  }
}
