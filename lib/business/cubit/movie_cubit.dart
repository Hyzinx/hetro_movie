import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hetro_anime/business/states/movie_state.dart';
import 'package:hetro_anime/data/exception_handeler/api_result.dart';
import 'package:hetro_anime/data/exception_handeler/network_exception.dart';
import 'package:hetro_anime/data/models/cast.dart';
import 'package:hetro_anime/data/models/movie.dart';
import 'package:hetro_anime/data/models/review.dart';
import 'package:hetro_anime/data/repositories/credit_repository.dart';
import 'package:hetro_anime/data/repositories/movie_repository.dart';
import 'package:hetro_anime/data/repositories/review_repository.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this.movieRepository, this.creditRepository, this.reviewRepository)
    : super(
        LoadingMoviesList(
          moviesPlayNow: [],
          moviesPopular: [],
          moviesUpcoming: [],
          topRatedMovies: [],
        ),
      );
  final ReviewRepository reviewRepository;
  final CreditRepository creditRepository;
  final MovieRepository movieRepository;

  void getAllMoviesTopRated() async {
    final data = await movieRepository.getAllMoviesTopRated();

    data.when(
      success: (List<Movie> moviesTopRated) {
        emit(
          ((state as LoadingMoviesList).copyWith(
            topRatedMovies: moviesTopRated,
          )),
        );
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ErrorLoadingData(networkExceptions));
      },
    );
  }

  void getAllMoviesPlayNow() async {
    final data = await movieRepository.getAllMoviesPlayNow();

    data.when(
      success: (List<Movie> moviesPlayNow) {
        emit(
          (state as LoadingMoviesList).copyWith(moviesPlayNow: moviesPlayNow),
        );
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ErrorLoadingData(networkExceptions));
      },
    );
  }

  void getAllMoviesUpcoming() async {
    final data = await movieRepository.getAllMoviesUpcoming();

    data.when(
      success: (List<Movie> moviesUpcoming) {
        emit(
          (state as LoadingMoviesList).copyWith(moviesUpcoming: moviesUpcoming),
        );
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ErrorLoadingData(networkExceptions));
      },
    );
  }

  void getAllMoviesPopular() async {
    final data = await movieRepository.getAllMoviesPopular();

    data.when(
      success: (List<Movie> moviesPopular) {
        emit(
          (state as LoadingMoviesList).copyWith(moviesPopular: moviesPopular),
        );
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ErrorLoadingData(networkExceptions));
      },
    );
  }

  void getSelecteMovieById(int id) async {
    final movie = await movieRepository.getMovieById(id);
    final reviewList = await reviewRepository.getMovieReview(id);
    final castList = await creditRepository.getMovieCast(id);

    movie.when(
      success: (Movie movieSelected) {
        reviewList.when(
          success: (List<Review> revieList) {
            castList.when(
              success: (List<Cast> castList) {
                emit(
                  LoadingMovieDetails(
                    movie: movieSelected,
                    listReview: revieList,
                    listCast: castList,
                  ),
                );
              },
              failure: (error) {
                emit(ErrorLoadingData(error));
              },
            );
          },
          failure: (error) {
            emit(ErrorLoadingData(error));
          },
        );
      },
      failure: (error) {
        emit(ErrorLoadingData(error));
      },
    );
  }
}
