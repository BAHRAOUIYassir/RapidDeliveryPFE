import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
    minimumSize: const Size(350, 70),
    backgroundColor:  const Color(0xFFFF9800),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(50)
        )
    )
);


class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PrimaryButton({super.key,required this.textbutton ,required this.onPressed, required this.textfontsize});

  final String textbutton;
  final double textfontsize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton
      (
      onPressed: onPressed,
      style: buttonPrimary,
      child: Text(
        textbutton,
        style: GoogleFonts.agbalumo(
          textStyle: TextStyle(
            color: Colors.black,
            fontSize: textfontsize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}