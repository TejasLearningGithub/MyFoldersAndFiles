import 'package:flutter/material.dart';
import 'package:prg_fantasy/screens/bottom_navigation/ex_prg.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Page 2"), actions: <Widget>[
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
                    child: Text("Switch Page - Leave a Like")))));
  }
}