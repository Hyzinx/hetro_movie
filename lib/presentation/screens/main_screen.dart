import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hetro_anime/business/cubit/movie_cubit.dart';
import 'package:hetro_anime/business/states/movie_state.dart';
import 'package:hetro_anime/consts/my_colors.dart';
import 'package:hetro_anime/consts/strings.dart';
import 'package:hetro_anime/data/models/movie.dart';
import 'package:hetro_anime/presentation/model/category.dart';
import 'package:hetro_anime/presentation/widgets/shared/list_category/list_category.dart';
import 'package:hetro_anime/presentation/widgets/shared/list_movies/movie_list_view.dart';
import 'package:hetro_anime/presentation/widgets/shared/top_movie_screen/top_movie.dart';
import 'package:hetro_anime/presentation/widgets/text_theme/text_theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Movie> moviesTopRated = [];
  List<Movie> moviesPlayNow = [];
  List<Movie> moviesUpcoming = [];
  List<Movie> moviesPopular = [];
  void onTapOnMovie(int movieId) {
    Navigator.pushNamed(context, detailsMovieScreenRoute, arguments: movieId);
  }

  int selectedIndex = 0;
  void onSelectedCategory(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget sendCurrectList(int index) {
    List<Movie> currentList = [];
    switch (index) {
      case 0:
        currentList = moviesPlayNow;
        break;
      case 1:
        currentList = moviesUpcoming;
        break;
      case 2:
        currentList = moviesTopRated;
        break;
      case 3:
        currentList = moviesPopular;
        break;
    }
    return MovieListView(onTapOnMovie: onTapOnMovie, selectedList: currentList);
  }

  @override
  void initState() {
    super.initState();
    context.read<MovieCubit>().getAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, MovieState state) {
        if (state is LoadingMoviesList) {
          moviesTopRated = state.topRatedMovies;
          moviesUpcoming = state.moviesUpcoming;
          moviesPlayNow = state.moviesPlayNow;
          moviesPopular = state.moviesPopular;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SearchWidget(),
                  BodyMideTheme(text: "Top Rated Movies"),
                  TopMovie(
                    onTapOnMovie: onTapOnMovie,
                    topRatedMovies: moviesTopRated,
                  ),
                  ListCategory(
                    selectedCategory: selectedIndex,
                    onSelectedCategory: onSelectedCategory,
                    categoryList: categoryMovie,
                  ),
                  sendCurrectList(selectedIndex),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(color: MyColors.ratingColors),
          );
        }
      },
    );
  }
}
