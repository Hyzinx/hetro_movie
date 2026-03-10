import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hetro_anime/business/cubit/movie_cubit.dart';
import 'package:hetro_anime/data/models/movie.dart';
import 'package:hetro_anime/presentation/widgets/shared/top_movie_screen/top_movie_card.dart';

class TopMovie extends StatefulWidget {
  const TopMovie({
    super.key,
    required this.onTapOnMovie,
    required this.topRatedMovies,
  });
  final void Function(int) onTapOnMovie;
  final List<Movie> topRatedMovies;

  @override
  State<TopMovie> createState() => _TopMovieState();
}

class _TopMovieState extends State<TopMovie> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.topRatedMovies.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            widget.onTapOnMovie(widget.topRatedMovies[index].id as int);
          },
          child: TopMovieCard(
            image: widget.topRatedMovies[index].posterPath,
            order: index + 1,
            key: ValueKey(index),
          ),
        ),
      ),
    );
  }
}
