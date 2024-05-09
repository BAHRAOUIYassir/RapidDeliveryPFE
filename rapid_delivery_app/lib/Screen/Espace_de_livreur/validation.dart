import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_livreur/login_screen.dart';
import 'package:rapid_delivery_app/widget/primary_button.dart';


import '../../widget/Text_widget.dart';

class Validation extends StatelessWidget {
  const Validation({super.key});

  void _handlePrimaryButton(BuildContext context) {
    //*********************Implement Button logic here******************
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text18(
                name: 'Email de récupération envoyé',
                color: Colors.black,
                fontWeight: FontWeight.bold),
            const SizedBox(
              height: 30,
            ),
            Image.asset('image/validationIcon.png'),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Veuillez vérifier votre boîte de réception e-mail pour récupérer votre mot de passe.Assurez-vous de consulter votre courrier électronique dès que possible. Merci !',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(
              height: 30,
            ),
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
            )
          ],
        ),
      ),
    );
  }
}
