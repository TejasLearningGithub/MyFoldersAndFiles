import 'dart:convert';
import 'dart:developer';

//import 'package:fantasy_cult/app/models/user_profile_model.dart';
import 'package:fantasy_cult/app/repository/base_repo.dart';
import 'package:fantasy_cult/app/utils/api_urls.dart';
import 'package:http/http.dart' as http;

class ProfileRepo extends BaseRepository {
  // Future<UserProfile> getData({required String? token}) async {
  //   //List<UserProfile> userProfile = [];
  //   UserProfile userProfile = UserProfile();

  //   try {
  //     final response = await http.get(
  //       Uri.parse(ApiUrls.baseURL + ApiUrls.profile),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': token!,
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       log('Repo ${response.body}');
  //       userProfile = UserProfile.fromJson(jsonDecode(response.body));

  //       // Iterable it = jsonDecode(response.body);
  //       // userProfile = it.map((e) => UserProfile.fromJson(e)).toList();
  //     } else {
  //       log(response.statusCode.toString());
  //       log(response.body.toString());
  //     }
  //   } catch (e) {
  //     log('Error in display Data =  + ${e.toString()}');
  //   }
  //   //throw Exception('Unexpected Error Occured');
  //   return userProfile;
  // }

  Future getProileDetails() async {
    // var myData = {
    //   "email_otp_id": "fcd1941c-7a04-4461-baab-b4ea8655537d",
    //   "mobile_otp_id": "92b49892-eb06-4d9e-a339-ff0376bb9817",
    //   "email_otp": "123456",
    //   "mobile_otp": "123456",
    //   "mobile": "1991898991",
    //   "email": "my002@gmail.com",
    //   "name": "XYZ",
    //   "profile_image": "",
    //   "gender": "M",
    //   "address": "abc-abcd,abdy",
    //   "pin_code": "382350",
    //   "team_name": "abcd",
    //   "referral_code": "H1W7bv2V"
    // };
    // final url = ApiUrls.baseURL + api;
    // log(url, name: 'getRequest');
    // log(myData.toString(), name: '$api data');

    // final headers = {'Content-Type': 'application/json'};

    // final request = http.Request('GET', Uri.parse(url));
    // request.body = json.encode(data);
    // request.headers.addAll(headers);

    // final streamResponse = await request.send();
    // final response = await http.Response.fromStream(streamResponse);
    // final response =
    //     await getRequest(api: ApiUrls.profile, token: true, data: myData);
    // log(response.body, name: 'getProfileDetails');

    // final mainUrl = ApiUrls.baseURL + url;
    // var headers = {
    //   'Content-Type': 'application/json',
    //   'Authorization': token,
    // };
    // final request = http.Request('GET', Uri.parse(mainUrl));
    // //request.body = json.encode(myData);
    // request.headers.addAll(headers);
    // final streamResponse = await request.send();
    // final response = await http.Response.fromStream(streamResponse);
    // log('=====');
    // log(response.body.toString(), name: 'Success Response 200 ok From Repo');
    // log('=====');
    // return json.decode(response.body);
    final response = await getHttp(api: ApiUrls.profile, token: true);
    log(response.body, name: 'getProfileDetails');
    return json.decode(response.body);
  }
}
