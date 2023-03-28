import 'package:accessing_kido_apis/country/country_provider.dart';
import 'package:accessing_kido_apis/country/country_screen.dart';
import 'package:accessing_kido_apis/get_state_by_country_id/state_provider.dart';
import 'package:accessing_kido_apis/get_state_by_country_id/state_screen.dart';
import 'package:accessing_kido_apis/kido/follow_up_provider.dart';

import 'package:accessing_kido_apis/mock_api_self/provider/mock_api_provider.dart';

import 'package:accessing_kido_apis/mock_apis/provider/mock_apis_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (_) => CountryProvider(),
        // ),
        ChangeNotifierProvider(
          create: (_) => MockProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MockApiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FollowUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CountryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => StateProvider(),
        ),
      ],
      child: const MaterialApp(home: StateScreen()),
    );
  }
}
