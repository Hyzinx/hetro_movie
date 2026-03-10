import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hetro_anime/consts/my_colors.dart';
import 'package:hetro_anime/consts/strings.dart';
import 'package:hetro_anime/data/models/review.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.reviews});
  final Review reviews;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      spreadRadius: 0.5,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: reviews.authorDetails!.avatarPath == null
                      ? Image.asset("assets/images/man.png")
                      : FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          image:
                              "$baseImageUrl${reviews.authorDetails!.avatarPath}",
                          placeholder: "assets/images/Loading.gif",
                        ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "${reviews.authorDetails!.rating ?? ""}",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: MyColors.mainBorderColore,
                ),
              ),
            ],
          ),
          SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${reviews.author}",
                  style: GoogleFonts.poppins(fontSize: 12),
                ),
                SizedBox(height: 5),
                Text(
                  "${reviews.content as String}",
                  style: TextStyle(inherit: true, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
