class MockPerson {
  String? firstName;
  String? lastName;
  String? message;
  String? id;

  MockPerson({this.firstName, this.lastName, this.message, this.id});

  MockPerson.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    message = json['message'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['message'] = message;
    data['id'] = id;
    return data;
  }
}
