class CenterModal {
  String? message;
  String? sId;
  String? schoolName;
  String? schoolDisplayName;
  String? countryId;
  String? zoneId;
  List<String>? programcategoryId;
  List<String>? programId;
  List<String>? actionTaken;
  String? setupType;
  String? agreementTermStart;
  String? agreementTermEnd;
  String? noOfRoom;
  String? designation;
  String? activitiesPortal;
  String? centerVideoUrl;
  String? websiteUrl;
  String? monToFriStartTime;
  String? monToFriEndTime;
  String? saturdayStartTime;
  String? saturdayEndTime;
  String? sundayStartTime;
  String? sundayEndTime;
  String? schoolCode;
  String? sizeOfSchool;
  String? schoolDescription;
  String? houseNo;
  String? landmark;
  String? city;
  String? street;
  String? area;
  String? state;
  String? pincode;
  String? contactNumber;
  String? emailId;
  String? whatsappNumber;
  String? corEntityName;
  String? corEmailId;
  String? corCorNumber;
  String? corGstNumber;
  String? corGstAddress;
  String? corCompanyPan;
  String? corCompanyCin;
  String? corReceipt;
  String? corSal;
  String? corSpoc;
  String? corCustomerEmail;
  String? schBankName;
  String? schAccountNumber;
  String? schBranchName;
  String? schBranchAddress;
  String? schIfsc;
  int? schTimetableBefore;
  int? schDocumentBefore;
  int? schTimetableAfter;
  int? schDocumentAfter;
  String? updatedBy;
  bool? success;
  String? updatedAt;
  int? iV;

  int? code;

  CenterModal(
      {this.message,
      this.actionTaken,
      this.activitiesPortal,
      this.agreementTermEnd,
      this.code,
      this.success,
      this.schoolName});

  CenterModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    sId = json['_id'];
    schoolName = json['school_name'];
    schoolDisplayName = json['school_display_name'];
    countryId = json['country_id'];
    zoneId = json['zone_id'];
    programcategoryId = json['programcategory_id'].cast<String>();
    programId = json['program_id'].cast<String>();

    setupType = json['setup_type'];
    agreementTermStart = json['agreement_term_start'];
    agreementTermEnd = json['agreement_term_end'];
    noOfRoom = json['no_of_room'];
    designation = json['designation'];
    activitiesPortal = json['activities_portal'];
    centerVideoUrl = json['center_video_url'];
    websiteUrl = json['website_url'];
    monToFriStartTime = json['mon_to_fri_start_time'];
    monToFriEndTime = json['mon_to_fri_end_time'];
    saturdayStartTime = json['saturday_start_time'];
    saturdayEndTime = json['saturday_end_time'];
    sundayStartTime = json['sunday_start_time'];
    sundayEndTime = json['sunday_end_time'];
    schoolCode = json['school_code'];
    sizeOfSchool = json['size_of_school'];
    schoolDescription = json['school_description'];
    houseNo = json['house_no'];
    landmark = json['landmark'];
    city = json['city'];
    street = json['street'];
    area = json['area'];
    state = json['state'];
    pincode = json['pincode'];
    contactNumber = json['contact_number'];
    emailId = json['email_id'];
    whatsappNumber = json['whatsapp_number'];
    corEntityName = json['cor_entity_name'];
    corEmailId = json['cor_email_id'];
    corCorNumber = json['cor_cor_number'];
    corGstNumber = json['cor_gst_number'];
    corGstAddress = json['cor_gst_address'];
    corCompanyPan = json['cor_company_pan'];
    corCompanyCin = json['cor_company_cin'];
    corReceipt = json['cor_receipt'];
    corSal = json['cor_sal'];
    corSpoc = json['cor_spoc'];
    corCustomerEmail = json['cor_customer_email'];
    schBankName = json['sch_bank_name'];
    schAccountNumber = json['sch_account_number'];
    schBranchName = json['sch_branch_name'];
    schBranchAddress = json['sch_branch_address'];
    schIfsc = json['sch_ifsc'];
    schTimetableBefore = json['sch_timetable_before'];
    schDocumentBefore = json['sch_document_before'];
    schTimetableAfter = json['sch_timetable_after'];
    schDocumentAfter = json['sch_document_after'];
    updatedBy = json['updatedBy'];
    success = json['success'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    code = json['code'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['_id'] = sId;
    data['school_name'] = schoolName;
    data['school_display_name'] = schoolDisplayName;
    data['country_id'] = countryId;
    data['zone_id'] = zoneId;
    data['programcategory_id'] = programcategoryId;
    data['program_id'] = programId;
    data['setup_type'] = setupType;
    data['agreement_term_start'] = agreementTermStart;
    data['agreement_term_end'] = agreementTermEnd;
    data['no_of_room'] = noOfRoom;
    data['designation'] = designation;
    data['activities_portal'] = activitiesPortal;
    data['center_video_url'] = centerVideoUrl;
    data['website_url'] = websiteUrl;
    data['mon_to_fri_start_time'] = monToFriStartTime;
    data['mon_to_fri_end_time'] = monToFriEndTime;
    data['saturday_start_time'] = saturdayStartTime;
    data['saturday_end_time'] = saturdayEndTime;
    data['sunday_start_time'] = sundayStartTime;
    data['sunday_end_time'] = sundayEndTime;
    data['school_code'] = schoolCode;
    data['size_of_school'] = sizeOfSchool;
    data['school_description'] = schoolDescription;
    data['house_no'] = houseNo;
    data['landmark'] = landmark;
    data['city'] = city;
    data['street'] = street;
    data['area'] = area;
    data['state'] = state;
    data['pincode'] = pincode;
    data['contact_number'] = contactNumber;
    data['email_id'] = emailId;
    data['whatsapp_number'] = whatsappNumber;
    data['cor_entity_name'] = corEntityName;
    data['cor_email_id'] = corEmailId;
    data['cor_cor_number'] = corCorNumber;
    data['cor_gst_number'] = corGstNumber;
    data['cor_gst_address'] = corGstAddress;
    data['cor_company_pan'] = corCompanyPan;
    data['cor_company_cin'] = corCompanyCin;
    data['cor_receipt'] = corReceipt;
    data['cor_sal'] = corSal;
    data['cor_spoc'] = corSpoc;
    data['cor_customer_email'] = corCustomerEmail;
    data['sch_bank_name'] = schBankName;
    data['sch_account_number'] = schAccountNumber;
    data['sch_branch_name'] = schBranchName;
    data['sch_branch_address'] = schBranchAddress;
    data['sch_ifsc'] = schIfsc;
    data['sch_timetable_before'] = schTimetableBefore;
    data['sch_document_before'] = schDocumentBefore;
    data['sch_timetable_after'] = schTimetableAfter;
    data['sch_document_after'] = schDocumentAfter;
    data['updatedBy'] = updatedBy;
    data['success'] = success;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;

    data['code'] = code;
    data['success'] = success;
    return data;
  }
}
