import 'package:ex_chat_gpt/repo.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final DataRepository dataRepository = DataRepository();
  List<Map<String, dynamic>> _dataList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final dataList = await dataRepository.fetchData();
    setState(() {
      _dataList = dataList!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accessing Maps inside List inside Map'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          final data = _dataList[index];
          final innerList = List<Map<String, dynamic>>.from(data['followups']);

          return ListTile(
            title: Text('ABC'),
            // subtitle: Text(data['description']),
            // trailing: Text(innerList[index]['value'].toString()),
          );
        },
      ),
    );
  }
}
