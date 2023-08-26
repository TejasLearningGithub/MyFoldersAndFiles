import 'package:flutter/material.dart';
import 'package:prg_fantasy/account/account_balance_tile.dart';
import 'package:prg_fantasy/carasoul_slider_demo/carousel_slider_first.dart';
import 'package:prg_fantasy/carasoul_slider_demo/carousel_slider_second.dart';
import 'package:prg_fantasy/carasoul_slider_demo/carousel_slider_stack_overflow_first.dart';
import 'package:prg_fantasy/concept_of_drawer/tabs/tabs_page.dart';
import 'package:prg_fantasy/flutter_clutter_textformfield_text/my_home_page.dart';
import 'package:prg_fantasy/initials/initial_first.dart';
import 'package:prg_fantasy/profile/edit_profile.dart';
import 'package:prg_fantasy/profile/fantasy_profile.dart';
import 'package:prg_fantasy/screens/bottom_navigation/ex_prg.dart';
import 'package:prg_fantasy/screens/bottom_navigation/ex_prg_cupertino_btm_nav.dart';
import 'package:prg_fantasy/screens/scree_checkbox_first.dart';
import 'package:prg_fantasy/screens/screen_date_picker.dart';
import 'package:prg_fantasy/screens/custom_searchable_dropdown.dart';
import 'package:prg_fantasy/screens/screen_radio.dart';
import 'package:prg_fantasy/screens/screen_radio_second.dart';
import 'package:prg_fantasy/screens/tab_bar_with_app_bar/my_screen.dart';
import 'package:prg_fantasy/sliding_from_top/ex_second.dart';
import 'package:prg_fantasy/sliding_from_top/ex_third.dart';
import 'package:prg_fantasy/text_form_field.dart';
import 'package:prg_fantasy/text_form_field_second.dart';

import 'screens/NEW/drop_down/my_new_list_drop_down.dart';

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
        home: const AccountBalance());
  }
}
