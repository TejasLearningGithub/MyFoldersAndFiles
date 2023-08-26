import 'package:api_pokeman_self/modal/poki_modal.dart';
import 'package:api_pokeman_self/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PokemonTypeContainer extends StatelessWidget {
  final String type;
  const PokemonTypeContainer({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: getBackGroundColor(type),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: type.text.xs.white.makeCentered(),
    ).wh(120, 10);
  }
}

class PokemonTypeList extends StatelessWidget {
  final List<Types> types;
  const PokemonTypeList({
    super.key,
    required this.types,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal, 
      shrinkWrap: true,
      itemCount: types.length,
      itemBuilder: (context, index) {
        return PokemonTypeContainer(type: types[index].types);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 20,
        );
      },
    );
  }
}
