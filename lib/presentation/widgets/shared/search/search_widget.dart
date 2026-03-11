import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hetro_anime/consts/my_colors.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.textEditingController, required this.onChangeText});
  final TextEditingController textEditingController;
  final Function(String) onChangeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MyColors.searchColore,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: onChangeText,
              controller: textEditingController,
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
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.search_circle),
          ),
        ],
      ),
    );
  }
}
