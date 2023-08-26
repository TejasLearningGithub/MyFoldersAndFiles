import 'package:ex_country/Post_Method/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  late PostProvider postProvider;

  initPref() async {
    await postProvider.getDataSimple();
  }

  @override
  void initState() {
    super.initState();
    postProvider = Provider.of<PostProvider>(context, listen: false);
    initPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State According Country'),
      ),
      body: ListView.builder(
          itemCount: postProvider.myList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(postProvider.myList.length.toString()),
            );
          }),
    );
  }
}
