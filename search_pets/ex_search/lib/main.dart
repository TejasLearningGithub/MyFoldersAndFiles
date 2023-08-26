import 'package:ex_search/pets/pets_disp_screen.dart';
import 'package:ex_search/pets/pets_provider.dart';
import 'package:ex_search/search_functionality/search_function_second.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'search_functionality/search_function_first.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PetsProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SearchFunctionSecond());
  }
}
