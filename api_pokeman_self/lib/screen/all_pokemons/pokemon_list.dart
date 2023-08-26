import 'package:api_pokeman_self/modal/poki_modal.dart';
import 'package:api_pokeman_self/screen/detail/pokeman_detail_screen.dart';
import 'package:api_pokeman_self/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PokemonListItem extends StatelessWidget {
  final Pokeman pokeman;
  const PokemonListItem({
    super.key,
    required this.pokeman,
  });

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: pokeman.name.text.xl2.make().pOnly(bottom: 10),
      header: '#${pokeman.id}'.text.xl2.make().pOnly(left: 10, top: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PokemonDetail(
                pokemon: pokeman,
              ),
            ),
          );
        },
        child: Card(
          color: pokemonTypeMap[pokeman.types[0].types],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Hero(
                  tag: pokeman.id,
                  child: Image.network(pokeman.imageUrl).p24()),
            ],
          ),
        ),
      ),
    );
  }
}

class PokemonList extends StatelessWidget {
  final List<Pokeman> pokemonList;
  final ScrollController scrollController;
  const PokemonList({
    super.key,
    required this.pokemonList,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: pokemonList.length,
      controller: scrollController,
      itemBuilder: (context, index) {
        return PokemonListItem(pokeman: pokemonList[index]);
      },
    );
  }
}
