class PokemonResult {
  String name;
  String url;

  PokemonResult({
    required this.name,
    required this.url,
  });

  PokemonResult copyWith({
    String? name,
    String? url,
  }) {
    return PokemonResult(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory PokemonResult.fromMap(Map<String, dynamic> myMap) {
    return PokemonResult(
      name: myMap['name'] as String,
      url: myMap['url'] as String,
    );
  }
}
