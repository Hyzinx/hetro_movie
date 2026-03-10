import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hetro_anime/business/cubit/movie_cubit.dart';
import 'package:hetro_anime/business/states/movie_state.dart';
import 'package:hetro_anime/consts/my_colors.dart';
import 'package:hetro_anime/data/exception_handeler/network_exception.dart';
import 'package:hetro_anime/data/models/cast.dart';
import 'package:hetro_anime/data/models/movie.dart';
import 'package:hetro_anime/data/models/review.dart';
import 'package:hetro_anime/presentation/model/category.dart';
import 'package:hetro_anime/presentation/widgets/shared/cast/cast_list.dart';
import 'package:hetro_anime/presentation/widgets/shared/list_category/list_category.dart';
import 'package:hetro_anime/presentation/widgets/shared/movie_details/movie_detail_header.dart';
import 'package:hetro_anime/presentation/widgets/shared/movie_details/movie_detail_info.dart';
import 'package:hetro_anime/presentation/widgets/shared/reiview/review_list.dart';
import 'package:hetro_anime/presentation/widgets/text_theme/text_theme.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key, required this.movieId});
  final int movieId;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  Movie movie = Movie();
  List<Review> reviews = [];
  List<Cast> casts = [];
  int selectedIndex = 0;

  void onSelectedCategory(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<MovieCubit>().getSelecteMovieById(widget.movieId);
  }

  Widget sendCurrectList(int index) {
    switch (index) {
      case 0:
        return Text(
          movie.overview as String,
          style: GoogleFonts.poppins(fontSize: 14, height: 1.5),
        );
      case 1:
        reviews.map((r) => print(r.author));
        if (reviews.isNotEmpty) {
          return ReviewList(reviews: reviews);
        } else {
          return Center(child: Text("No Reviews"));
        }
      case 2:
        if (casts.isNotEmpty) {
          return CastList(casts: casts);
        } else {
          return Center(child: Text("No Reviews"));
        }
    }
    return Text("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        title: BodyMideTheme(text: "Detail"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark_outline_sharp),
          ),
        ],
      ),
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, MovieState state) {
          if (state is LoadingMovieDetails) {
            movie = state.movie;
            reviews = state.listReview;
            casts = state.listCast;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieDetailHeader(
                    movieName: movie.title as String,
                    backGroundImage: movie.backdropPath as String,
                    posterImage: movie.posterPath as String,
                    movieRated: movie.voteAverage!.toStringAsFixed(1),
                  ),
                  SizedBox(height: 20),
                  MovieDetailInfo(
                    movieYearDate: movie.releaseDate as String,
                    movieTimeInMinutes: movie.runtime as int,
                    movieCategories: movie.genres!.first.name as String,
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListCategory(
                          selectedCategory: selectedIndex,
                          onSelectedCategory: onSelectedCategory,
                          categoryList: categoryDetail,
                        ),
                        SizedBox(height: 30),
                        sendCurrectList(selectedIndex),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ErrorLoadingData) {
            return Text(
              NetworkExceptions.getErrorMessage(state.networkExceptions),
            );
          } else {
            return Center(
              child: Container(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(color: MyColors.ratingColors),
              ),
            );
          }
        },
      ),
    );
  }
}
