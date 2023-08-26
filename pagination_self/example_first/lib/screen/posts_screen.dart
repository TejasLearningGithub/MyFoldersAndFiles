import 'dart:developer';

import 'package:example_first/modal/posts_model.dart';
import 'package:example_first/provider/posts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsDetailScreen extends StatefulWidget {
  const PostsDetailScreen({super.key});

  @override
  State<PostsDetailScreen> createState() => _PostsDetailScreenState();
}

class _PostsDetailScreenState extends State<PostsDetailScreen> {
  late PostsProvider postsProvider;
  bool isLoading = true;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    postsProvider = Provider.of<PostsProvider>(context, listen: false);
    loadData();
    setState(() {
      isLoading = true;
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !isLoading) {
        log('New Data Call');
        loadData();
      }
    });
    setState(() {
      isLoading = false;
    });
    super.initState();
  }

  loadData() async {
    await postsProvider.getData();
  }

  @override
  Widget build(BuildContext context) {
    //int count = context.select((PostsProvider value) => value.myList.length);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Data Pagination'),
      ),
      body: Column(
        children: [
          Selector<PostsProvider, List<PostsModal>>(selector: (p0, p1) {
            return p1.myList;
          }, builder: (context, value, child) {
            return SizedBox(
              height: 750,
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      controller: scrollController,
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child:
                                      Text('=========${index + 1}=========')),
                              Text(value[index].id.toString()),
                              Text(value[index].title.toString()),
                            ],
                          ),
                        );
                      }),
            );
          })
        ],
      ),
    );
  }
}
