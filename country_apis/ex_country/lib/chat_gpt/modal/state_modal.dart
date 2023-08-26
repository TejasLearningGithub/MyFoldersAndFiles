class StateModel {
  String? name;
  String? country;

  StateModel({required this.name, required this.country});

  StateModel.fromJson(Map<String, dynamic> json) {
    StateModel(
      name: json['name'],
      country: json['country'],
    );
  }
}
