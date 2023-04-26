import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kido_drop_down_apis/bookmark/book_mark_provider.dart';
import 'package:provider/provider.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  late BookMarkProvider bookMarkProvider;

  @override
  void initState() {
    super.initState();
    bookMarkProvider = Provider.of<BookMarkProvider>(context, listen: false);
    //bookMarkProvider.bookMarkModal;
    initPrefs();
  }

  initPrefs() {
    bookMarkProvider.myBookMarkModal.message = 'saved';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Mark Screen'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              bool val = await bookMarkProvider.doToggle();

              log('Button Clicked');
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text(bookMarkProvider.myBookMarkModal.message ?? '')));
            },
            child: Text('Press For Toggle'),
          ),
          Consumer<BookMarkProvider>(
            builder: (context, value, child) {
              return Text(value.myBookMarkModal.message.toString());
            },
          )
        ],
      )),
    );
  }
}
