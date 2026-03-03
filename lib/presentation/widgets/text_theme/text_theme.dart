import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyLargTheme extends StatelessWidget {
  const BodyLargTheme({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
