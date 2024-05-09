import 'package:flutter/material.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
    minimumSize: const Size(400, 60),
    backgroundColor: const Color.fromARGB(255, 255, 153, 0),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50))
          ) 
        );

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.textbutton,
    required this.onPressed,
    required this.textfontsize,
    required this.style,
  });

  final String textbutton;
  final double textfontsize;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonPrimary,
        child: Text(
          textbutton,
          style: style,
        ),
        
      ),
    );
  }
}
