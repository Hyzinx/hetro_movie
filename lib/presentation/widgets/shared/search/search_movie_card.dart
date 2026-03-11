import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hetro_anime/consts/my_colors.dart';
import 'package:hetro_anime/consts/strings.dart';
import 'package:hetro_anime/data/models/movie.dart';

class SearchMovieCard extends StatelessWidget {
  const SearchMovieCard({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    print("==========${movie.genres}");
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 200,
            width: 130,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: (movie.posterPath == null)
                  ? Image.asset("assets/images/Loading.gif")
                  : FadeInImage.assetNetwork(
                      height: 200,
                      placeholder: 'assets/images/Loading.gif',
                      image: "$baseImageUrl${movie.posterPath}",
                    ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: 220,
                child: Text(
                  "${movie.title}",
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.star,
                      color: MyColors.ratingColors,
                      size: 23,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "${movie.voteAverage}",
                      style: GoogleFonts.poppins(color: MyColors.ratingColors),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.ticket, color: Colors.white),
                    SizedBox(width: 5),
                    Text("${movie.genres !=null?movie.genres!.first.name:"none"}", style: GoogleFonts.poppins()),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
