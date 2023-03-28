import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:follow_up_kido/provider/follow_up_provider.dart';
import 'package:provider/provider.dart';

class MyFollowUpDisp extends StatefulWidget {
  const MyFollowUpDisp({super.key});

  @override
  State<MyFollowUpDisp> createState() => _MyFollowUpDispState();
}

class _MyFollowUpDispState extends State<MyFollowUpDisp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Accesing Follow Ups Data'),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 200,
            child: Consumer<FollowUpProvider>(builder: (context, value, child) {
              return Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(value.myFlist[0].data?.followups?[index]
                                  .childName ??
                              'not loaded'),
                        ],
                      );
                    }),
              );
            }),
          ),
        ));
  }
}
