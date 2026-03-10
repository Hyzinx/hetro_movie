import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hetro_anime/consts/my_colors.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MyColors.searchColore
      ),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hint: Text(
                  "Search",
                  style: GoogleFonts.poppins(
                    color: MyColors.secondaryBorderColore,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
    );
  }
}
