class CenterModal {
  String? message;

  int? code;
  bool? success;
  String? sId;
  String? schoolName;
  String? schoolDisplayName;

  CenterModal(
      {this.message,
      this.sId,
      this.schoolDisplayName,
      this.schoolName,
      this.code,
      this.success});

  CenterModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    success = json['success'];
    sId = json['_id'];
    schoolName = json['school_name'];
    schoolDisplayName = json['school_display_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;

    data['code'] = code;
    data['success'] = success;
    data['_id'] = sId;
    data['school_name'] = schoolName;
    data['school_display_name'] = schoolDisplayName;

    return data;
  }
}

