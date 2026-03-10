import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hetro_anime/consts/strings.dart';
import 'package:hetro_anime/data/models/cast.dart';

class CastCard extends StatelessWidget {
  const CastCard({super.key, required this.cast});
  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 130,
          height: 140,

          child: cast.profilePath == null
              ? cast.gender == 1
                    ? Image.asset("assets/images/man.png")
                    : Image.asset("assets/images/woman.png")
              : ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(100),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    image: "$baseImageUrl${cast.profilePath}",
                    placeholder: "assets/images/Loading.gif",
                  ),
                ),
        ),
        SizedBox(height: 10),
        Text(
          cast.name as String,
          style: GoogleFonts.poppins(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
