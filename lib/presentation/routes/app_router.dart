import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hetro_anime/business/cubit/movie_cubit.dart';
import 'package:hetro_anime/consts/strings.dart';
import 'package:hetro_anime/injection.dart';
import 'package:hetro_anime/presentation/screens/home_screen.dart';
import 'package:hetro_anime/presentation/screens/movie_details_screen.dart';
import 'package:hetro_anime/presentation/screens/search_screen.dart';
import 'package:hetro_anime/presentation/screens/watch_list_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => MovieCubit(getIt(), getIt(), getIt()),
              child: HomeScreen(),
            );
          },
        );
      case detailsMovieScreenRoute:
        final int movieId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => MovieCubit(getIt(), getIt(), getIt()),
              child: MovieDetailsScreen(movieId: movieId),
            );
          },
        );
    }
  }
}
