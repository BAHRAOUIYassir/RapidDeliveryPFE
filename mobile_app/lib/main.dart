import 'package:flutter/material.dart';

import 'screen/welcome.dart';

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
      home: const SafeArea(child: welcome()),
      theme: ThemeData(fontFamily: 'fonts/inter-Regular.ttf'),
      //hada theme data kdar fiha xi haja li atkon f ga3 les page bhal back ground bhla font
    );
  }
}
