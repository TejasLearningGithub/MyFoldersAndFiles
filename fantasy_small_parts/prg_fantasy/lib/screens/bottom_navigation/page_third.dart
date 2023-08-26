import 'package:flutter/material.dart';
import 'package:prg_fantasy/screens/bottom_navigation/page_second.dart';
import 'package:prg_fantasy/screens/listview_page.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Page 3"), actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.ac_unit),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Page2()));
                  })
            ]),
            body: Align(
                alignment: Alignment.center,
                child: TextButton(
                    //color: Colors.blue, textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ListViewPage()));
                    },
                    child: Text("Switch Page - Comment")))));
  }
}