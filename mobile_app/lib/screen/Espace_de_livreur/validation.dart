import 'package:flutter/material.dart';

import '../../widget/Text_widget.dart';
import '../../widget/widget.dart';


class Validation extends StatelessWidget {
  const Validation({super.key});

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
            Image.asset('image/poster1.png'),
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
            button(name: 'se connecter', sizetext: 20)
          ],
        ),
      ),
    );
  }
}
