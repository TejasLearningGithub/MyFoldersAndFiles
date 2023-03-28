class MyFollowUpModel {
  String? message;
  Data? data;
  int? code;
  bool? success;

  MyFollowUpModel({this.message, this.data, this.code, this.success});

  MyFollowUpModel.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? '';
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    code = json['code'] ?? '';
    success = json['success'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = code;
    data['success'] = success;
    return data;
  }
}

class Data {
  int? totalRecords;
  List<Followups>? followups;

  Data({this.totalRecords, this.followups});

  Data.fromJson(Map<String, dynamic> json) {
    totalRecords = json['total_records'];
    if (json['followups'] != null) {
      followups = <Followups>[];
      json['followups'].forEach((v) {
        followups!.add(Followups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_records'] = totalRecords;
    if (followups != null) {
      data['followups'] = followups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Followups {
  String? sId;
  String? followStatus;
  String? followSubStatus;
  String? enqStage;
  String? type;
  String? followUpDate;
  CenterId? centerId;
  String? leadNo;
  String? leadName;
  String? childName;
  LeadId? leadId;
  int? isWhatsapp;
  int? isEmail;

  Followups(
      {this.sId,
      this.followStatus,
      this.followSubStatus,
      this.enqStage,
      this.type,
      this.followUpDate,
      this.centerId,
      this.leadNo,
      this.leadName,
      this.childName,
      this.leadId,
      this.isWhatsapp,
      this.isEmail});

  Followups.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? '';
    followStatus = json['follow_status'] ?? '';
    followSubStatus = json['follow_sub_status'] ?? '';
    enqStage = json['enq_stage'] ?? '';
    type = json['type'] ?? '';
    followUpDate = json['follow_up_date'] ?? '';
    centerId =
        json['center_id'] != null ? CenterId.fromJson(json['center_id']) : null;
    leadNo = json['lead_no'] ?? '';
    leadName = json['lead_name'] ?? '';
    childName = json['child_name'] ?? '';
    leadId = json['lead_id'] != null ? LeadId.fromJson(json['lead_id']) : null;
    isWhatsapp = json['is_whatsapp'] ?? '';
    isEmail = json['is_email'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['follow_status'] = followStatus;
    data['follow_sub_status'] = followSubStatus;
    data['enq_stage'] = enqStage;
    data['type'] = type;
    data['follow_up_date'] = followUpDate;
    if (centerId != null) {
      data['center_id'] = centerId!.toJson();
    }
    data['lead_no'] = leadNo;
    data['lead_name'] = leadName;
    data['child_name'] = childName;
    if (leadId != null) {
      data['lead_id'] = leadId!.toJson();
    }
    data['is_whatsapp'] = isWhatsapp;
    data['is_email'] = isEmail;
    return data;
  }
}

class CenterId {
  String? sId;
  String? schoolName;
  String? schoolDisplayName;

  CenterId({this.sId, this.schoolName, this.schoolDisplayName});

  CenterId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? '';
    schoolName = json['school_name'] ?? '';
    schoolDisplayName = json['school_display_name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['school_name'] = schoolName;
    data['school_display_name'] = schoolDisplayName;
    return data;
  }
}

class LeadId {
  String? sId;
  Null? childDob;
  String? childGender;
  String? primaryParent;
  String? parentName;

  LeadId(
      {this.sId,
      this.childDob,
      this.childGender,
      this.primaryParent,
      this.parentName});

  LeadId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? '';
    childDob = json['child_dob'] ?? '';
    childGender = json['child_gender'] ?? '';
    primaryParent = json['primary_parent'] ?? '';
    parentName = json['parent_name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['child_dob'] = childDob;
    data['child_gender'] = childGender;
    data['primary_parent'] = primaryParent;
    data['parent_name'] = parentName;
    return data;
  }
}
