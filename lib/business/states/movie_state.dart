import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hetro_anime/data/exception_handeler/network_exception.dart';
import 'package:hetro_anime/data/models/cast.dart';
import 'package:hetro_anime/data/models/movie.dart';
import 'package:hetro_anime/data/models/review.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class LoadingMoviesList extends MovieState {
  final List<Movie> topRatedMovies;
  final List<Movie> moviesPlayNow;
  final List<Movie> moviesUpcoming;
  final List<Movie> moviesPopular;

  LoadingMoviesList({
    required this.topRatedMovies,
    required this.moviesPlayNow,
    required this.moviesUpcoming,
    required this.moviesPopular,
  });

  LoadingMoviesList copyWith({
    List<Movie>? topRatedMovies,
    List<Movie>? moviesPlayNow,
    List<Movie>? moviesUpcoming,
    List<Movie>? moviesPopular,
  }) {
    return LoadingMoviesList(
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      moviesPlayNow: moviesPlayNow ?? this.moviesPlayNow,
      moviesUpcoming: moviesUpcoming ?? this.moviesUpcoming,
      moviesPopular: moviesPopular ?? this.moviesPopular,
    );
  }
}

final class LoadingMovieDetails extends MovieState {
  final Movie movie;
  final List<Review> listReview;
  final List<Cast> listCast;

  LoadingMovieDetails({
    required this.movie,
    required this.listReview,
    required this.listCast,
  });

  LoadingMovieDetails copyWith({
    Movie? movie,
    List<Review>? listReview,
    List<Cast>? listCast,
  }) {
    return LoadingMovieDetails(
      movie: movie ?? this.movie,
      listReview: listReview ?? this.listReview,
      listCast: listCast ?? this.listCast,
    );
  }
}

final class SearchMovieList extends MovieState {
  final List<Movie> movies;
  SearchMovieList({required this.movies});

  SearchMovieList copyWith({List<Movie>? movies}) {
    return SearchMovieList(movies: movies ?? this.movies);
  }
}

final class ErrorLoadingData extends MovieState {
  final NetworkExceptions networkExceptions;
  ErrorLoadingData(this.networkExceptions);
}
