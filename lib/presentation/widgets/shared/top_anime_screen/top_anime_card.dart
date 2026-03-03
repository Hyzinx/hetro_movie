import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hetro_anime/consts/my_colors.dart';

class TopAnimeCard extends StatelessWidget {
  const TopAnimeCard({super.key,required this.image,required this.order});
  final String image;
  final int order;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.bottomLeft,
      children: [
        Container(
          height: 292,
          width: 180,
          padding: EdgeInsets.only(top: 30, left: 20, right: 10, bottom: 50),
          child: Image.asset(image),
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
