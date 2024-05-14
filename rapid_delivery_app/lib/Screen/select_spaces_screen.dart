import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_livreur/home_screen.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_livreur/splash_screen.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_suivie/suivie_number_commande.dart';

import '../widget/primary_button.dart';
import 'Espace_de_livreur/login_screen.dart';

class SelectSpace extends StatelessWidget {
  const SelectSpace({super.key});

  //Yassir: Hadi tt7ot fiha logic dyal button b7al Navigator ola shi 7aja akhera

  //Yassir: button dyal Espace de suivie
  void _handleButtonDeliverySpace(BuildContext context) {
    //*********************Implement Button logic here******************
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SpashScreen();
            }
            if (snapshot.hasData) {
              return const HomeScreen();
            }
            return const LoginScreen();
          }),
        ),
      ),
    );
  }

  //Yassir: button dyal Suivie ma commande
  void _handleButtonTrackingSpace(BuildContext context) {
    // *********************Implement Button logic here******************
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Suive_Commande()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('image/select_space_background.png'),
                fit: BoxFit.cover, // adjust as per your needs
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  textbutton: 'Espace livreur',
                  onPressed: () {
                    _handleButtonDeliverySpace(context);
                  },
                  textfontsize: 25,
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                PrimaryButton(
                  textbutton: 'Suivie ma commande',
                  onPressed: () {
                    _handleButtonTrackingSpace(context);
                  },
                  textfontsize: 25,
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
