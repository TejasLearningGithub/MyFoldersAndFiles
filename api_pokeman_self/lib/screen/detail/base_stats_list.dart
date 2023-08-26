import 'package:api_pokeman_self/modal/poki_modal.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BaseStatsContainer extends StatelessWidget {
  final Stats stats;
  const BaseStatsContainer({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        stats.name.text.white.make().py(5),
        Container(
          width: 270,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              Container(
                width: stats.stat * 1,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: "".text.makeCentered(),
              ),
            ],
          ),
        ).pOnly(left: 20)
      ],
    );
  }
}

class BaseStatsList extends StatelessWidget {
  final List<Stats> stats;
  const BaseStatsList({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stats.length,
      itemBuilder: (context, index) {
        return BaseStatsContainer(stats: stats[index]);
      },
    ).px16();
  }
}
