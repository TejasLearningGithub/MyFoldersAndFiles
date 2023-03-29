import 'dart:convert';

import 'package:ex_first/my_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class MySelfCode extends StatefulWidget {
  const MySelfCode({super.key});

  @override
  State<MySelfCode> createState() => _MySelfCodeState();
}

class _MySelfCodeState extends State<MySelfCode> {
  List<Dataseries> dataSeries = [];

  Future getData() async {
    var response = await http.get(
      Uri.parse(
        'https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0',
      ),
    );
    Map<String, dynamic> userMap = jsonDecode(response.body);
    var timer = Timer.fromJson(userMap);

    setState(() {
      dataSeries = timer.dataseries!;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List APis'),
      ),
      body: ListView.builder(
        itemCount: dataSeries.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dataSeries[index].timepoint.toString()),
              Text(dataSeries[index].cloudcover.toString()),
              Text(dataSeries[index].seeing.toString()),
              Text(dataSeries[index].transparency.toString()),
              Text(dataSeries[index].liftedIndex.toString()),
              Text(dataSeries[index].rh2m.toString()),
              Text(dataSeries[index].wind10m!.speed.toString()),
              Text(dataSeries[index].wind10m!.direction.toString()),
              Text(dataSeries[index].temp2m.toString()),
              Text(dataSeries[index].precType.toString()),
              Text('================================================')
            ],
          );
        },
      ),
    );
  }
}
