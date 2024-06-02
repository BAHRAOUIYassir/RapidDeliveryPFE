import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_livreur/login_screen.dart';
import 'package:rapid_delivery_app/widget/Text_widget.dart';
import 'package:rapid_delivery_app/widget/primary_button.dart';

class SignUpSuccessfuly extends StatefulWidget {
  const SignUpSuccessfuly({super.key});

  @override
  State<SignUpSuccessfuly> createState() => _SignUpSuccessfulyState();
}

class _SignUpSuccessfulyState extends State<SignUpSuccessfuly> {
  void _handlePrimaryButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 350,
        ),
        text24(name: "Vous êtes inscrit avec succès", color: Colors.black),
        const SizedBox(
          height: 15,
        ),
        Image.asset(
          'image/valide.png',
          height: 120,
        ),
        const SizedBox(
          height: 20,
        ),
        text18(
                  name:
                      'Vous recevrez un e-mail après avoir traité votre demande',
                  fontWeight: FontWeight.bold,
                  text: TextAlign.center),
        text18(name: ""),
        PrimaryButton(
          textbutton: 'SE CONNECTER',
          textfontsize: 20,
          onPressed: () {
            _handlePrimaryButton(context);
          },
          style: GoogleFonts.aBeeZee(
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ));
  }
}
