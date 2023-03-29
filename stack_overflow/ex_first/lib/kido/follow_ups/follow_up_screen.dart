import 'dart:convert';

import 'package:ex_first/kido/follow_ups/follow_up_modal.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FollowUpScreen extends StatefulWidget {
  const FollowUpScreen({super.key});

  @override
  State<FollowUpScreen> createState() => _FollowUpScreenState();
}

class _FollowUpScreenState extends State<FollowUpScreen> {
  List<Followups> followList = [];
  List<Followups> tempFollowList = [];
  var token =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjQwNzczOWQ2ZWZkNmYxOWNmMDcxNiIsIm5hbWUiOiJzeXN0ZW0gYWRtaW4iLCJlbWFpbCI6InN5c2FkbWluQHN5c3RlbS5jb20iLCJpYXQiOjE2NzkwNDQ0NzQsImV4cCI6MTY4NjgyMDQ3NH0.IQBBZ6LftcJ2Xa-0_L6JkWTZ1Tj2f8w9GHONf545-w0';
  int page = 1;
  Future getDataOfFollowUps() async {
    try {
      var response = await http.get(
          Uri.parse(
              'http://45.79.123.102:49005/api/followups/all/pastthirtydays/${page}'),
          headers: {'Authorization': token});
      if (response.statusCode == 200) {
        Map<String, dynamic> userMap = jsonDecode(response.body);
        var model = FollowUpsModal.fromJson(userMap);

        setState(() {
          followList = model.data!.followups!;
          page == 1
              ? {tempFollowList.addAll(followList), page++}
              : tempFollowList = followList;
        });
        print('It Works');
      }
    } catch (e) {
      print('Error = ${e.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
    getDataOfFollowUps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Accessing'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: followList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(tempFollowList[index].sId ?? ''),
                          Text(tempFollowList[index].followStatus ?? ''),
                          Text(tempFollowList[index].followSubStatus ?? ''),
                          Text('===================================='),
                        ],
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
