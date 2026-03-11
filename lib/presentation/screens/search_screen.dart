import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hetro_anime/business/cubit/movie_cubit.dart';
import 'package:hetro_anime/business/states/movie_state.dart';
import 'package:hetro_anime/consts/my_colors.dart';
import 'package:hetro_anime/data/exception_handeler/network_exception.dart';
import 'package:hetro_anime/data/models/movie.dart';
import 'package:hetro_anime/presentation/widgets/shared/search/search_movie_card.dart';
import 'package:hetro_anime/presentation/widgets/shared/search/search_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textInputControl = TextEditingController();
  List<Movie> movies = [];
  List<Movie> topMovies = [];

  void onChangeText(String newText) {
    context.read<MovieCubit>().searchForMovie(newText);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          SearchWidget(
            textEditingController: textInputControl,
            onChangeText: onChangeText,
          ),
          BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              if (state is SearchMovieList) {
                movies = state.movies;
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: movies.length,
                    itemBuilder: (context, index) =>
                        SearchMovieCard(movie: movies[index]),
                  ),
                );
              } else if (state is ErrorLoadingData) {
                return Center(
                  child: Text(
                    NetworkExceptions.getErrorMessage(state.networkExceptions),
                  ),
                );
              } else if (state is LoadingMoviesList) {
                topMovies = state.topRatedMovies;
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: topMovies.length,
                    itemBuilder: (context, index) =>
                        SearchMovieCard(movie: topMovies[index]),
                  ),
                );
              } else {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: MyColors.ratingColors,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
