// class Country {
//   String? message;
//   List<Data>? data;
//   int? code;
//   bool? success;

//   Country({this.message, this.data, this.code, this.success});

//   Country.fromJson(Map<String, dynamic> json) {
//     message = json['message'] ?? '';
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(Data.fromJson(v));
//       });
//     }
//     code = json['code'] ?? '';
//     success = json['success'] ?? '';
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['code'] = code;
//     data['success'] = success;
//     return data;
//   }
// }

// class Data {
//   String? sId;
//   int? id;
//   int? countryId;
//   String? stateName;
//   String? stateCode;

//   Data({this.sId, this.id, this.countryId, this.stateName, this.stateCode});

//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     id = json['id'];
//     countryId = json['country_id'];
//     stateName = json['state_name'];
//     stateCode = json['state_code'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['_id'] = sId;
//     data['id'] = id;
//     data['country_id'] = countryId;
//     data['state_name'] = stateName;
//     data['state_code'] = stateCode;
//     return data;
//   }
// }
