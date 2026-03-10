import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hetro_anime/consts/my_colors.dart';
import 'package:hetro_anime/consts/strings.dart';

class MovieDetailHeader extends StatelessWidget {
  const MovieDetailHeader({
    super.key,
    required this.movieName,
    required this.backGroundImage,
    required this.posterImage,
    required this.movieRated,
  });
  final String movieName;
  final String backGroundImage;
  final String posterImage;
  final String movieRated;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 70),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
            child: FadeInImage.assetNetwork(
              image: "$baseImageUrl$backGroundImage",
              placeholder: "assets/images/Loading.gif",
            ),
          ),
        ),
        Positioned(
          right: 20,
          bottom: 90,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.star_border_rounded, color: MyColors.ratingColors),
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Text(
                    movieRated,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: MyColors.ratingColors,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 30,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  image: "https://image.tmdb.org/t/p/w500$posterImage",
                  height: 150,
                  width: 100,
                  placeholder: "assets/images/Loading.gif",
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 80, left: 20),
                width: 184,
                child: Text(
                  movieName,
                  style: GoogleFonts.poppins(fontSize: 20),
                  softWrap: true,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
