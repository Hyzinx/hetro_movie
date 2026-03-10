import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hetro_anime/consts/my_colors.dart';

class MovieDetailInfo extends StatelessWidget {
  const MovieDetailInfo({
    super.key,
    required this.movieYearDate,
    required this.movieTimeInMinutes,
    required this.movieCategories,
  });
  final String movieYearDate;
  final int movieTimeInMinutes;
  final String movieCategories;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InfoDetail(
          data: movieYearDate.split("-").first,
          icon: Icons.calendar_today_outlined,
        ),
        Container(
          height: 20,
          width: 1,
          color: MyColors.secondaryFontColors,
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        ),
        InfoDetail(
          data: "$movieTimeInMinutes Minutes",
          icon: CupertinoIcons.clock,
        ),
        Container(
          height: 20,
          width: 1,
          color: MyColors.secondaryFontColors,
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        ),
        InfoDetail(data: movieCategories, icon: CupertinoIcons.ticket),
      ],
    );
  }
}

class InfoDetail extends StatelessWidget {
  const InfoDetail({super.key, required this.data, required this.icon});
  final String data;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Icon(icon, color: MyColors.secondaryFontColors, size: 18),
        ),
        Text(
          data,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            color: MyColors.secondaryFontColors,
          ),
        ),
      ],
    );
  }
}
