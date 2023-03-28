// class Country {
//   String? message;
//   //List<Data>? data;
//   int? code;
//   bool? success;
//   String? country_name;
//   Country({this.message,this.country_name,  this.code, this.success});

//   Country.fromJson(Map<String, dynamic> json) {
//     message = json['message'] ?? '';
//     // if (json['data'] != null) {
//     //   data = <Data>[];
//     //   json['data'].forEach((v) {
//     //     data!.add(Data.fromJson(v));
//     //   });
//     // }
//     code = json['code'] ?? 0;
//     success = json['success'] ?? false;
//     // return Country(
//     //   message:  json['message'],
//     //   data : json['data']
//     // );
//     country_name = json[country_name] ?? '';
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['message'] = message;
//     // if (this.data != null) {
//     //   data['data'] = this.data!.map((v) => v.toJson()).toList();
//     // }
//     data['code'] = code;
//     data['success'] = success;
//     return data;
//   }
// }

// class Data {
//   String? sId;
//   int? countryId;
//   String? countryCode;
//   String? countryName;

//   Data({this.sId, this.countryId, this.countryCode, this.countryName});

//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'] ?? '';
//     countryId = json['country_id'] ?? 111;
//     countryCode = json['country_code'] ?? '';
//     countryName = json['country_name'] ?? '';
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['_id'] = sId;
//     data['country_id'] = countryId;
//     data['country_code'] = countryCode;
//     data['country_name'] = countryName;
//     return data;
//   }
// }




class CountryModal {
  String? sId;
  int? countryId;
  String? countryCode;
  String? countryName;

  CountryModal({this.sId, this.countryId, this.countryCode, this.countryName});

  CountryModal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? '';
    countryId = json['country_id'] ?? 0;
    countryCode = json['country_code'] ?? '';
    countryName = json['country_name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['country_id'] = countryId;
    data['country_code'] = countryCode;
    data['country_name'] = countryName;
    return data;
  }
}