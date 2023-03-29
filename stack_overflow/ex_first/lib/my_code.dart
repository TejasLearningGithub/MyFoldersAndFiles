import 'dart:convert';

import 'package:ex_first/my_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late String p;

  late String i;

  late List<Dataseries> d;

  Future getData() async {
    var response = await http.get(
      Uri.parse(
          "https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0"),
    );

    Map<String, dynamic> userMap = jsonDecode(response.body);

    var timer = Timer.fromJson(userMap);

    setState(() {
      p = timer.product!;

      i = timer.init!;

      d = timer.dataseries!;
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Listviews"), backgroundColor: Colors.blue),
      body: ListView.builder(
      
        itemCount: d == null ? 0 : d.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [
                Text(
                    'timepoint=${d[index].timepoint} seeing=${d[index].seeing} cloudcover=${d[index].cloudcover} seeing=${d[index].seeing}'),
                Text(d[index].wind10m!.speed.toString()),
                Text(d[index].rh2m.toString()),
                Text(p.toString()),
              ],
            ),
          );
        },
      ),
    );
  }
}
