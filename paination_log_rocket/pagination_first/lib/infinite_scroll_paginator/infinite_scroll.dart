import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pagination_first/model/post.dart';
import 'package:http/http.dart';
import 'package:pagination_first/post_items/post_items.dart';

class InfiniteScroll extends StatefulWidget {
  const InfiniteScroll({super.key});

  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {
  final _numberOfPostsPerRequest = 10;
  final PagingController<int, Post> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final response = await get(Uri.parse(
          'https://jsonplaceholder.typicode.com/posts?_page=$pageKey&_limit=$_numberOfPostsPerRequest'));
      List responseList = json.decode(response.body);
      List<Post> postList = responseList
          .map((data) => Post(data['title'], data['body']))
          .toList();
      final isLastPage = postList.length < _numberOfPostsPerRequest;
      if (isLastPage) {
        _pagingController.appendLastPage(postList);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(postList, nextPageKey);
      }
    } catch (e) {
      print('Error = ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Scrolling'),
      ),
      body: RefreshIndicator(
        child: PagedListView(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Post>(
            itemBuilder: (context, item, index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: PostItem(
                  item.title,
                  item.body,
                ),
              );
            },
          ),
        ),
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }
}
