import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../widget/welcom_screen_widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _controller = PageController();

  int dotIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView(
                    onPageChanged: (value) {
                      setState(() {
                        dotIndex = value;
                      });
                    },
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Apponbroadpage(_controller, context,
                          imagepath: "image/page1.png",
                          titre: 'Livraison Rapide',
                          soustitre:
                              'Votre livraison rapide et efficace garantie. Avec notre réseau de livreurs et nos algorithmes avancés, vos colis arrivent en un temps record.',
                          index: 1,
                          btnTitre: 'Next',
                          SKp: 'Skip'),
                      Apponbroadpage(_controller, context,
                          imagepath: "image/page2.png",
                          titre: 'Suivi en Temps Réel',
                          soustitre:
                              "Ne perdez jamais de vue vos colis. Suivez-les à chaque étape, de l'entrepôt jusqu'à votre porte, grâce à notre suivi en temps réel.",
                          index: 2,
                          btnTitre: 'Next',
                          SKp: 'Skip'),
                      Apponbroadpage(
                        _controller,
                        context,
                        imagepath: "image/page3.webp",
                        titre: 'Service Client Exceptionnel',
                        soustitre:
                            'Notre équipe est là pour vous, 24/7. Des réponses rapides à toutes vos questions, pour une expérience de livraison sans stress.',
                        index: 3,
                        btnTitre: 'Get Started',
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 20.0,
                    child: DotsIndicator(
                      dotsCount: 3,
                      position: dotIndex,
                      decorator: DotsDecorator(
                        size: const Size.square(8),
                        activeSize: const Size(18.0, 8.0),
                        activeColor: const Color(0xFFFF9800),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Affiche toujours le sous-titre au-dessus de l'indicateur de points
          ],
        ),
      ),
    );
  }
}
