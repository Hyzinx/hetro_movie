import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hetro_anime/data/models/movie.dart';
import 'package:hetro_anime/data/repositories/movie_repository.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this.movieRepository) : super(MovieInitial());
  MovieRepository movieRepository;

  void getAllMoviesPlayNow() {
    movieRepository.getAllMoviesPlayNow().then((movies) {
      emit(LoadPlayNowMovies(movies));
    });
  }
}
