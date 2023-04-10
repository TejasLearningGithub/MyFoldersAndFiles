class ActionPlannedModel {
  String? sId;
  String? name;
  String? status;

  ActionPlannedModel({this.sId, this.name, this.status});

  ActionPlannedModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? '';
    name = json['name'] ?? '';
    status = json['status'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['status'] = status;
    return data;
  }
}
