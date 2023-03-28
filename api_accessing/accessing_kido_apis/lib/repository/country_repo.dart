import 'dart:convert';

import 'package:accessing_kido_apis/model/country_model.dart';
import 'package:http/http.dart' as http;

// class CountryRepo {
//   // Future getStateByCountry({
//   //   required String token,
//   //   required int countryId,
//   // }) async {
//   //   var response = await http.get(
//   //       Uri.parse(
//   //         'http://45.79.123.102:49005/api/state/getstatebycountry?country_id=$countryId',
//   //       ),
//   //       headers: token == null
//   //           ? {
//   //               'Content-Type': 'application/json',
//   //             }
//   //           : {
//   //               'Authorization': token,
//   //             });

//   //     if(response.statusCode == 200){
//   //       print('It works');
//   //     }
//   //     else{
//   //       print('Error');
//   //     }

//   // }

//   Future<List<Country>?> getCountries({
//     //required String api,
//     required String token,
//     required Map<String, dynamic> body,
//   }) async {
//     var headers = {
//       'Content-Type': 'application/json',
//       'Authorization': token,
//     };

//     http.get(Uri.parse('http://45.79.123.102:49005/api/state/getstatebycountry',),);



//     var request = http.Request('GET',
//         Uri.parse('http://45.79.123.102:49005/api/state/getstatebycountry'));
//     request.body = json.encode(body);
//     request.headers.addAll(headers);

//     http.StreamedResponse streamResponse = await request.send();

//     http.Response response = await http.Response.fromStream(streamResponse);
//     //json.decode(response.body);
//     Iterable it = jsonDecode(response.body);
//     List<Country> person = it.map((e) => Country.fromJson(e)).toList();
//     print('repo works');
//     return person;
//   }
// }
