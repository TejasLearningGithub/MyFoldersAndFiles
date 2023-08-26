class MenuItem {
  final String value;
  final String display;
  int? code;
  String? type;

  MenuItem({
    required this.value,
    required this.display,
    this.code,
    this.type,
  });
}
