import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  const CustomText({Key key, this.text, this.size, this.color, this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size ?? 16,
          color: color ?? Colors.black,
          fontWeight: weight ?? FontWeight.normal),
    );
  }
}

class Font extends StatelessWidget {
  final String text;

  const Font({Key key, this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.lato(fontStyle: FontStyle.italic));
  }
}
