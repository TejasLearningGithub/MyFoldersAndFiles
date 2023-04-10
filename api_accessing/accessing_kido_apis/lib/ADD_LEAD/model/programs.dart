class Programs {
  String? message;

  String? sId;
  String? programName;
  int? code;
  bool? success;

  Programs({this.message, this.sId, this.programName, this.code, this.success});

  Programs.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? '';
    sId = json['_id'] ?? '';
    programName = json['program_name'] ?? '';
    code = json['code'] ?? 0;
    success = json['success'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['_id'] = sId;
    data['program_name'] = programName;
    data['code'] = code;
    data['success'] = success;
    return data;
  }
}
