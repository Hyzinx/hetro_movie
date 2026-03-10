import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hetro_anime/consts/my_colors.dart';

class TopMovieCard extends StatelessWidget {
  const TopMovieCard({super.key, required this.image, required this.order});
  final String? image;
  final int order;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.bottomLeft,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, left: 15, right: 10, bottom: 50),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: image == null
                ? Image.asset("assets/images/Loading.gif")
                : FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    image: "https://image.tmdb.org/t/p/w500$image",
                    placeholder: "assets/images/Loading.gif",
                  ),
          ),
        ),
        Positioned(
          left: 18,
          bottom: 0,
          child: Text(
            '$order',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 100,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 3
                ..color = MyColors.mainBorderColore,
            ),
          ),
        ),
        Positioned(
          left: 18,
          child: Text(
            '$order',
            style: GoogleFonts.montserrat(
              fontSize: 100,
              color: MyColors.mainColore,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
