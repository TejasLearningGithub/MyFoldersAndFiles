import 'dart:convert';
import 'dart:developer';

import 'package:api_pokeman_self/modal/poki_modal.dart';
import 'package:api_pokeman_self/modal/poki_result.dart';
import 'package:api_pokeman_self/screen/all_pokemons/pokemon_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class AllPokemon extends StatefulWidget {
  const AllPokemon({super.key});

  @override
  State<AllPokemon> createState() => _AllPokemonState();
}

class _AllPokemonState extends State<AllPokemon> {
  List<Pokeman> pokemons = [];
  String url = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=20";
  bool isLoading = false;
  final ScrollController scrollController = ScrollController();

  void getPokemonData(String url) async {
    var response = await http.get(Uri.parse(url));
    var decodeJson = jsonDecode(response.body);
    var pokemon = Pokeman.fromMap(decodeJson);

    setState(() {
      pokemons.add(pokemon);
      pokemons.sort((a, b) => a.id.compareTo(b.id));
      isLoading = false;
    });
  }

  void loadPokemons() async {
    try {
      setState(() {
        isLoading = true;
      });
      var response = await http.get(Uri.parse(url));
      var decodedJson = jsonDecode(response.body);
      var result = decodedJson['results'];
      url = decodedJson['next'];
      var pokemons =
          List.from(result).map((e) => PokemonResult.fromMap(e)).toList();
      for (var result in pokemons) {
        getPokemonData(result.url);
      }
    } catch (e) {
      log('Error = ${e.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
    loadPokemons();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!isLoading) {
          setState(() {
            loadPokemons();
          });
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: "Poke App".text.white.bold.make(),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: pokemons.isEmpty
                    ? const CircularProgressIndicator().centered()
                    : PokemonList(
                            pokemonList: pokemons,
                            scrollController: scrollController)
                        .p12(),
              ),
              Container(
                height: (isLoading && pokemons.isNotEmpty) ? 50.0 : 0,
                color: Colors.transparent,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
