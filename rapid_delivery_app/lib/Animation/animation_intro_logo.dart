import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_livreur/login_screen.dart';
import 'package:rapid_delivery_app/Screen/select_spaces_screen.dart';
import 'package:rapid_delivery_app/Screen/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen(this.appName, this.appNameColor, {super.key});

  final String appName;
  final Color appNameColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          LottieBuilder.asset(
            'image/pfe_anim_logo.json',
            width: 220,
            height: 220,
          ),
          AnimatedTextKit(
            totalRepeatCount: 40,
            animatedTexts: [
              FadeAnimatedText(
                appName,
                textStyle: GoogleFonts.alkatra(
                  textStyle: TextStyle(
                    color: appNameColor,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                duration: const Duration(milliseconds: 3300),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
      nextScreen: const WelcomeScreen(),
      splashIconSize: 280,
    );
  }
}
