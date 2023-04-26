class ZoneModal {
  String? message;
  int? code;
  bool? success;
  String? sId;
  String? name;

  ZoneModal({
    this.message,
    this.name,
    this.sId,
    this.code,
    this.success,
  });

  ZoneModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    sId = json['_id'];
    name = json['name'];
    code = json['code'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['_id'] = sId;
    data['name'] = name;
    data['code'] = code;
    data['success'] = success;
    return data;
  }
}
