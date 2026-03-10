import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hetro_anime/consts/my_colors.dart';

class CategoryWidget<T> extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.categoryName,
    required this.onSelected,
    required this.isSelected,
  });
  final String categoryName;
  final void Function() onSelected;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: isSelected
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: MyColors.secondaryColore, width: 5),
                ),
              )
            : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            categoryName,
            strutStyle: StrutStyle(),
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: MyColors.fontColors,
            ),
          ),
        ),
      ),
    );
  }
}
