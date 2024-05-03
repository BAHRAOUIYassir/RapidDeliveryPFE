import 'package:flutter/material.dart';
import 'package:mobile_app/screen/select_spaces_screen.dart';

import 'animation/animation_intro_logo.dart';

void main() {
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
          child:
              // YASSIR : Hadi hiya logo animation meli ttsali ttdik l welcome screen
              SplashScreen('Delevery App', Color(0xFFFF9800))),
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
