import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StateModel {
  String name;
  String country;

  StateModel({required this.name, required this.country});

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      name: json['name'],
      country: json['country'],
    );
  }
}

class CountryStatesPage extends StatefulWidget {
  const CountryStatesPage({super.key});

  @override
  _CountryStatesPageState createState() => _CountryStatesPageState();
}

class _CountryStatesPageState extends State<CountryStatesPage> {
  List<StateModel> stateList = [];
  // Future<List<StateModel>> fetchStatesData() async {
  //   try {
  //     final response = await http.get(
  //         Uri.parse('https://countriesnow.space/api/v0.1/countries/states'));

  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> data = json.decode(response.body);
  //       final List<dynamic>? statesData =
  //           data['data']['states']; // Add a null check here
  //       if (statesData != null) {
  //         return statesData
  //             .map((stateJson) => StateModel.fromJson(stateJson))
  //             .toList();
  //       } else {
  //         print('States data is null');
  //         return [];
  //       }
  //     } else {
  //       print('Failed to load states data: ${response.statusCode}');
  //       return [];
  //     }
  //   } catch (error) {
  //     print('Error fetching states data: $error');
  //     return [];
  //   }
  // }
  Future<List<StateModel>> getData() async {
    try {
      final response = await http.get(
          Uri.parse('https://countriesnow.space/api/v0.1/countries/states'));
      if (response.statusCode == 200) {
        var myList = jsonDecode(response.body);
        stateList = myList.map((e) => StateModel.fromJson(e)).toList();
      } else {
        throw Exception('unexpected error occured');
      }
    } catch (e) {
      print('Error in display Data = ' + e.toString());
    }
    return stateList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country States'),
      ),
      body: FutureBuilder<List<StateModel>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final states = snapshot.data;
            if (states == null || states.isEmpty) {
              return Center(child: Text('No data available.'));
            }
            return ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                final state = states[index];
                return ListTile(
                  title: Text(snapshot.data![index].country.toString()),
                  // subtitle: Text(state.country),
                );
              },
            );
          }
        },
      ),
    );
  }
}
