class CountryModel {
  String? message;
  String? sId;
  int? countryId;
  String? countryCode;
  String? countryName;

  int? code;
  bool? success;

  CountryModel({
    this.message,
    this.sId,
    this.countryCode,
    this.countryId,
    this.countryName,
    this.code,
    this.success,
  });

  CountryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    success = json['success'];
    sId = json['_id'];
    countryId = json['country_id'];
    countryCode = json['country_code'];
    countryName = json['country_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['_id'] = sId;
    data['country_id'] = countryId;
    data['country_code'] = countryCode;
    data['country_name'] = countryName;
    data['code'] = code;
    data['success'] = success;
    return data;
  }
}
