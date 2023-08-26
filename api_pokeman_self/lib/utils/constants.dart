import 'package:flutter/material.dart';

class Constants {
  static Color creamColor = const Color(0xfff5f5f5);
}
  Map<String, Color> pokemonTypeMap = {
    "grass": const Color(0xFF78C850),
    "poison": const Color(0xFF98558e),
    "fire": const Color(0xFFFB6C6C),
    "flying": const Color(0xFFA890F0),
    "bug": const Color(0xFF48D0B0),
    "water": const Color(0xFF7AC7FF),
    "normal": const Color(0xFFbcbcad),
    "ground": const Color(0xFFeece5a),
    "fairy": const Color(0xFFf9acff),
    "electric": const Color(0xFFfee53c),
    "fighting": const Color(0xFFa75544),
    "psychic": const Color(0xFFf160aa),
    "rock": const Color(0xFFcebd74),
    "steel": const Color(0xFFc4c2db),
    "ice": const Color(0xFF96f1ff),
    "ghost": const Color(0xFF7C538C),
    "dragon": const Color(0xD07038F8),
    "dark": const Color(0xFF8f6955),
  };

  Color getBackGroundColor(String type) {
    return pokemonTypeMap[type]!;
  }

