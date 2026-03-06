part of 'movie_cubit.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class LoadPlayNowMovies extends MovieState {
  final List<Movie> playNowMovies;
  LoadPlayNowMovies(this.playNowMovies);
}
