class FollowUpModel {
  int? isWhatsapp;
  int? isEmail;
  String? sId;
  String? followStatus;
  String? followSubStatus;
  String? enqStage;
  String? type;
  String? followUpDate;
  Center? centerId;
  String? leadNo;
  String? leadName;
  String? childName;
  LeadId? leadId;

  FollowUpModel({
    this.isWhatsapp,
    this.isEmail,
    this.sId,
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
  });

  FollowUpModel.fromJson(Map<String, dynamic> json) {
    isWhatsapp = json['is_whatsapp'] ?? 0;
    isEmail = json['is_email'] ?? 0;
    sId = json['_id'] ?? '';
    followStatus = json['follow_status'] ?? '';
    followSubStatus = json['follow_sub_status'] ?? '';
    enqStage = json['enq_stage'] ?? '';
    type = json['type'] ?? '';
    followUpDate = json['follow_up_date'] ?? '';
    centerId = json['center_id'] != null
        ? Center.fromJson(json['center_id'])
        : Center(sId: '', schoolDisplayName: '', schoolName: '');
    leadNo = json['lead_no'] ?? '';
    leadName = json['lead_name'] ?? '';
    childName = json['child_name'] ?? '';
    leadId = json['lead_id'] != null
        ? LeadId.fromJson(json['lead_id'])
        : LeadId(
            sId: '',
            childDob: '2023-01-01T18:30:00.000Z',
            childGender: 'M',
            parentName: '',
            primaryParent: '',
          );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_whatsapp'] = isWhatsapp;
    data['is_email'] = isEmail;
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
    return data;
  }
}

class LeadId {
  String? sId;
  String? childDob;
  String? childGender;
  String? primaryParent;
  String? parentName;

  LeadId({
    this.sId,
    this.childDob,
    this.childGender,
    this.primaryParent,
    this.parentName,
  });

  LeadId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? '';
    childDob = json['child_dob'] ?? '2023-01-01T18:30:00.000Z';
    childGender = json['child_gender'] ?? 'M';
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

class Center {
  String? sId;
  String? schoolName;
  String? schoolDisplayName;

  Center({this.sId, this.schoolName, this.schoolDisplayName});

  Center.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? '';
    schoolName = json['school_name'] ?? '-';
    schoolDisplayName = json['school_display_name'] ?? '-';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['school_name'] = schoolName;
    data['school_display_name'] = schoolDisplayName;
    return data;
  }
}
