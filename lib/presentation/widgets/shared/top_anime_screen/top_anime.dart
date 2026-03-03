import 'package:flutter/material.dart';
import 'package:hetro_anime/presentation/widgets/shared/top_anime_screen/top_anime_card.dart';

class TopAnime extends StatefulWidget {
  const TopAnime({super.key});

  @override
  State<TopAnime> createState() => _TopAnimeState();
}

class _TopAnimeState extends State<TopAnime> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => TopAnimeCard(
          image: "assets/images/movie-1.png",
          order: index+1,
          key: ValueKey(index),
        ),
      ),
    );
  }
}
