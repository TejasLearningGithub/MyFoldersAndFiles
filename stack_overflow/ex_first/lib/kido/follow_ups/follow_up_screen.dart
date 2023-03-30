import 'dart:convert';

import 'package:ex_first/kido/follow_ups/follow_up_modal.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FollowUpScreen extends StatefulWidget {
  const FollowUpScreen({super.key});

  @override
  State<FollowUpScreen> createState() => _FollowUpScreenState();
}

class _FollowUpScreenState extends State<FollowUpScreen> {
  final PagingController<int, Followups> _pagingController =
      PagingController(firstPageKey: 0);
  List<Followups> followList = [];
  List<Followups> tempFollowList = [];
  final _numberOfPostsPerRequest = 10;
  var token =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjQwNzczOWQ2ZWZkNmYxOWNmMDcxNiIsIm5hbWUiOiJzeXN0ZW0gYWRtaW4iLCJlbWFpbCI6InN5c2FkbWluQHN5c3RlbS5jb20iLCJpYXQiOjE2NzkwNDQ0NzQsImV4cCI6MTY4NjgyMDQ3NH0.IQBBZ6LftcJ2Xa-0_L6JkWTZ1Tj2f8w9GHONf545-w0';
  int page = 1;
  Future getDataOfFollowUps(int pageKey) async {
    try {
      var response = await http.get(
          Uri.parse(
              'http://45.79.123.102:49005/api/followups/all/pastthirtydays/page=$pageKey                                                                                                                                   '),
          headers: {'Authorization': token});
      if (response.statusCode == 200) {
        Map<String, dynamic> userMap = jsonDecode(response.body);
        var model = FollowUpsModal.fromJson(userMap);

        setState(() {
          followList = model.data!.followups!;
          // page == 1
          //     ? {tempFollowList.addAll(followList), page++}
          //     : tempFollowList = followList;
          tempFollowList = followList;
        });
        final isLastPage = followList.length < _numberOfPostsPerRequest;
        if (isLastPage) {
          _pagingController.appendLastPage(followList);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(followList, nextPageKey);
        }

        print('It Works');
      }
    } catch (e) {
      print('Error = ${e.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
    // getDataOfFollowUps();
    _pagingController.addPageRequestListener((pageKey) {
      getDataOfFollowUps(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Api Accessing'),
        ),
        body: RefreshIndicator(
          onRefresh: () => Future.sync(
            () => _pagingController.refresh(),
          ),
          child: PagedListView(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Followups>(
                itemBuilder: (context, item, index) {
              return ListView.builder(
                  itemCount: followList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text('ABC'),
                        Text(tempFollowList[index].sId ?? ''),
                        Text(tempFollowList[index].followStatus ?? ''),
                        Text(tempFollowList[index].followSubStatus ?? ''),
                        Text('===================================='),
                      ],
                    );
                  });
            }),
          ),
        ));
  }
}
