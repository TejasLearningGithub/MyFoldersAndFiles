class StateModal {
  String? message;
  String? sid;
  int? id;
  int? code;
  bool? success;
  int? countryId;
  String? stateName;
  String? stateCode;

  StateModal({
    this.message,
    this.sid,
    this.id,
    this.code,
    this.success,
    this.countryId,
    this.stateCode,
    this.stateName,
  });

  StateModal.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? '';
    sid = json['_id'] ?? '';
    code = json['code'] ?? 1;
    success = json['success'] ?? true;
    stateName = json['state_name'] ?? '';
    stateCode = json['state_code'] ?? '';
    id = json['id'] ?? 0;
    countryId = json['country_id'] ?? 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['success'] = success;
    data['_id'] = sid;
    data['id'] = id;
    data['state_name'] = stateName;
    data['state_code'] = stateCode;
    data['country_id'] = countryId;
    return data;
  }
}
