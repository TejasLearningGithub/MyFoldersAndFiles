class Pokeman {
  int id;
  int height;
  String name;
  int weight;
  List<Stats> stats;
  List<Types> types;

  Pokeman(
    this.id,
    this.name,
    this.height,
    this.weight,
    this.stats,
    this.types,
  );

  String get imageUrl {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
  }

  Pokeman copyWith({
    int? id,
    String? name,
    int? height,
    int? weight,
    List<Stats>? stats,
    List<Types>? types,
  }) {
    return Pokeman(
      id ?? this.id,
      name ?? this.name,
      height ?? this.height,
      weight ?? this.weight,
      stats ?? this.stats,
      types ?? this.types,
    );
  }

  factory Pokeman.fromMap(Map<String, dynamic> myMap) {
    return Pokeman(
      myMap['id'],
      myMap['name'],
      myMap['height'],
      myMap['weight'],
      List<Stats>.from(myMap['stats']?.map((x) => Stats.fromMap(x))),
      List<Types>.from(myMap['types']?.map((x) => Types.fromMap(x))),
    );
  }
}

class Stats {
  int stat;
  String name;

  Stats({
    required this.stat,
    required this.name,
  });

  Stats copyWith({int? stat, String? name}) {
    return Stats(
      stat: stat ?? this.stat,
      name: name ?? this.name,
    );
  }

  factory Stats.fromMap(Map<String, dynamic> myJson) {
    int stat = myJson['base_stat'];
    String name = myJson['stat']['name'];
    Stats? statsVariable;
    if (name == 'hp') {
      statsVariable = Stats(stat: stat, name: 'HP ');
    } else if (name == 'attack') {
      statsVariable = Stats(stat: stat, name: 'ATK');
    } else if (name == 'defense') {
      statsVariable = Stats(stat: stat, name: 'DEF');
    } else if (name == 'special-attack') {
      statsVariable = Stats(stat: stat, name: 'STK');
    } else if (name == 'special-defense') {
      statsVariable = Stats(stat: stat, name: 'SEF');
    } else if (name == 'speed') {
      statsVariable = Stats(stat: stat, name: 'SPD');
    }
    return statsVariable!;
  }
}

class Types {
  String types;

  Types({
    required this.types,
  });

  Types copyWith({String? types}) {
    return Types(types: types ?? this.types);
  }

  factory Types.fromMap(Map<String, dynamic> myMap) {
    return Types(types: myMap['type']['name'] ?? 'null');
  }
}
