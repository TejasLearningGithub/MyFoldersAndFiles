import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prg_fantasy/concept_of_drawer/screens/home.dart';
import 'package:prg_fantasy/concept_of_drawer/screens/profile.dart';
import 'package:prg_fantasy/concept_of_drawer/screens/search.dart';


class TabNavigationItem {
  final Widget? page;
  final Widget? title;
  final Icon? icon;

  TabNavigationItem({this.page, this.title, this.icon});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: Home(),
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        TabNavigationItem(
          page: Search(),
          icon: Icon(Icons.search),
          title: Text("Search"),
        ),
        TabNavigationItem(
          page: Profile(),
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
      ];
}