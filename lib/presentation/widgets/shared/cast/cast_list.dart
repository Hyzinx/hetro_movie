import 'package:flutter/material.dart';
import 'package:hetro_anime/data/models/cast.dart';
import 'package:hetro_anime/presentation/widgets/shared/cast/cast_card.dart';

class CastList extends StatelessWidget {
  const CastList({super.key, required this.casts});
  final List<Cast> casts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: casts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 50,
        mainAxisSpacing: 20,
        mainAxisExtent: 190
      ),
      itemBuilder: (context, index) => CastCard(cast: casts[index]),
    );
  }
}
