import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceRow extends StatelessWidget {
  final String leftString;
  final String rightString;

  const PriceRow(
      {required String leftString, required String rightString, Key? key})
      : this.leftString = leftString, this.rightString = rightString, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          leftString,
          style: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily, fontSize: 15),
        ),
        Expanded(child: SizedBox()),
        Text(
          rightString,
          style: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily, fontSize: 15),
        ),
      ],
    );
  }
}
