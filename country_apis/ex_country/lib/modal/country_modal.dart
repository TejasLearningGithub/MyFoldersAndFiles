// //================================================
// class Data {

//   String? iso3;
//   List<States>? states;

//   Data({this.name, this.iso3, this.states});

//   Data.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     iso3 = json['iso3'];
//     if (json['states'] != null) {
//       states = <States>[];
//       json['states'].forEach((v) {
//         states!.add(States.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['name'] = name;
//     data['iso3'] = iso3;
//     if (states != null) {
//       data['states'] = states!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class States {
//   String? name;
//   String? stateCode;

//   States({this.name, this.stateCode});

//   States.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     stateCode = json['state_code'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['name'] = name;
//     data['state_code'] = stateCode;
//     return data;
//   }
// }

class StateModal {
  bool? error;
  String? msg;
  //List<Data>? data;
  String? name;
  String? iso3;
  String? stateCode;
  StateModal({this.error, this.msg, this.name, this.iso3, this.stateCode});

  StateModal.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    name = json['name'];
    iso3 = json['iso3'];
    stateCode = json['stateCode'];
  }
}
