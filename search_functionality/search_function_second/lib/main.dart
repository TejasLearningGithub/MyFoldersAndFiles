import 'package:flutter/material.dart';
import 'package:search_function_second/TwoNine/ex_self_search.dart';
import 'package:search_function_second/TwoNine/my_self_search.dart';
import 'package:search_function_second/TwoNine/self_search.dart';
import 'package:search_function_second/search_function.dart';
import 'package:search_function_second/self/search_function_self.dart';

import 'from_stackoverflow/search_function_first.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MySelfSearch(),
    );
  }
}
