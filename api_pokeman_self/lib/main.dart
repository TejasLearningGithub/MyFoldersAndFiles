import 'package:api_pokeman_self/screen/all_pokemons/pokemon_screen.dart';
import 'package:api_pokeman_self/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        PokeApiRoutes.pokemonScreen: (context) => const AllPokemon(),
      },
      initialRoute: PokeApiRoutes.pokemonScreen,
    );
  }
}
