import 'package:flutter/material.dart';
import 'package:kido_drop_down_apis/bookmark/book_mark_provider.dart';
import 'package:kido_drop_down_apis/bookmark/book_mark_screen.dart';
import 'package:kido_drop_down_apis/common/programs/program_provier.dart';
import 'package:kido_drop_down_apis/common/programs/program_screen.dart';
import 'package:kido_drop_down_apis/common/screen/center_data_screen.dart';
import 'package:kido_drop_down_apis/ex_drop_down.dart';
import 'package:kido_drop_down_apis/filter_functionality/mock_apis/provider/person_provider.dart';
import 'package:kido_drop_down_apis/filter_functionality/mock_apis/screen/person_display.dart';
import 'package:kido_drop_down_apis/info_card/info_card_screen.dart';
import 'package:kido_drop_down_apis/kido/chip_with_tab_bar/ex_self.dart';
import 'package:kido_drop_down_apis/kido/chip_with_tab_bar/experiment/my_ex_first.dart';
import 'package:kido_drop_down_apis/kido/chip_with_tab_bar/experiment/my_ex_second.dart';
import 'package:kido_drop_down_apis/kido/chip_with_tab_bar/my_app.dart';
import 'package:kido_drop_down_apis/kido_tab_bar_chip/ex_self.dart';
import 'package:kido_drop_down_apis/kido_tab_bar_chip/kido_screen.dart';
import 'package:kido_drop_down_apis/provider/center_provider.dart';
import 'package:kido_drop_down_apis/provider/country_provider.dart';
import 'package:kido_drop_down_apis/provider/zone_provider.dart';
import 'package:kido_drop_down_apis/use_wrap_flutter/ex_wrap.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CountryProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ZoneProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => KidoCenterProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => PersonProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ProgramProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => BookMarkProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WrapW(),
    );
  }
}
