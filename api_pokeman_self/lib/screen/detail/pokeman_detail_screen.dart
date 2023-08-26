import 'package:api_pokeman_self/modal/poki_modal.dart';
import 'package:api_pokeman_self/screen/detail/base_stats_list.dart';
import 'package:api_pokeman_self/screen/detail/pokemon_type_list.dart';
import 'package:api_pokeman_self/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class WeightHeightContainer extends StatelessWidget {
  final String title, value;
  const WeightHeightContainer({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        value.text.white.xl2.bold.make(),
        const SizedBox(
          height: 10,
        ),
        title.text.gray500.make(),
      ],
    );
  }
}

class PokemonDetail extends StatelessWidget {
  final Pokeman pokemon;
  const PokemonDetail({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: getBackGroundColor(pokemon.types[0].types),
          elevation: 0,
          title: "PokeDex".text.bold.make(),
          actions: [
            "#${pokemon.id}".text.bold.xl2.makeCentered().pOnly(right: 20)
          ],
        ),
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.zero,
              color: getBackGroundColor(pokemon.types[0].types),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child:
                  Hero(tag: pokemon.id, child: Image.network(pokemon.imageUrl))
                      .wh(context.screenWidth, 200),
            ),
            pokemon.name.text.xl4.bold.white.makeCentered().pOnly(top: 20),
            PokemonTypeList(types: pokemon.types).h(40).pOnly(top: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WeightHeightContainer(
                    title: 'Weight', value: '${pokemon.weight / 10} KG'),
                WeightHeightContainer(
                    title: 'Height', value: '${pokemon.height / 10} M')
              ],
            ).pOnly(top: 20),
            "Base Stats".text.xl2.white.makeCentered().pOnly(top: 20),
            BaseStatsList(stats: pokemon.stats).expand(),
          ],
        ),
      ),
    );
  }
}
