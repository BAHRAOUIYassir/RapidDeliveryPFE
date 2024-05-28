import 'package:flutter/material.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_livreur/Screen/profile.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_suivie/suivie_detail_commande.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_suivie/suivie_number_commande.dart';
import 'package:rapid_delivery_app/Screen/select_spaces_screen.dart';
import 'package:rapid_delivery_app/firebase_options.dart';
import 'Animation/animation_intro_logo.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // hadi bax kthyd dik debug li ktkon fjnb lfo9
      home: const SafeArea(
        child: SplashScreen(
          'RapidDelivery',
          Color(0xFFFF9800),
        ),
        // YASSIR : Hadi hiya logo animation meli ttsali ttdik l welcome screen

        // SuiveCommande(),Profile(), ,
      ),
      theme: ThemeData(
          fontFamily: 'fonts/inter-Regular.ttf',
          scaffoldBackgroundColor: Colors.white),

      //hada theme data kdar fiha xi haja li atkon f ga3 les page bhal back ground bhla font
      routes: {
        'loginpage': (context) => const SelectSpace(),
      },
      //salim: hada route knst3mloh bax n puche les page whda ri bsmiya smtiha puchNamed
    );
  }
}
