import 'package:flutter/material.dart';
import 'package:rapid_delivery_app/widget/primary_button.dart';
import 'package:rapid_delivery_app/widget/text_widget.dart';

class Notfound extends StatelessWidget {
  const Notfound({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text24(name: 'ORDER NOT FOUND'),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'image/notFound.png',
                width: 250,
              ),
              const SizedBox(
                height: 20,
              ),
              text18(
                  name:
                      'Numéro de commande invalide Veuillez vérifier et réessayer. Merci.',
                  fontWeight: FontWeight.bold,
                  text: TextAlign.center),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                  textbutton: "Back",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  textfontsize: 30,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
