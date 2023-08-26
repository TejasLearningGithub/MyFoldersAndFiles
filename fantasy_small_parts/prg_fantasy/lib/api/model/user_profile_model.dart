

class ProfileModel {
  String? mobile;
  String? email;
  String? name;
  String? profileImage;
  bool? gender;
  String? address;
  String? pinCode;
  String? teamName;
  String? referralCode;

  ProfileModel(
      {this.mobile,
      this.email,
      this.name,
      this.profileImage,
      this.gender,
      this.address,
      this.pinCode,
      this.teamName,
      this.referralCode});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    email = json['email'];
    name = json['name'];
    profileImage = json['profile_image'];
    gender = json['gender'];
    address = json['address'];
    pinCode = json['pin_code'];
    teamName = json['team_name'];
    referralCode = json['referral_code'];
  }

 
}
