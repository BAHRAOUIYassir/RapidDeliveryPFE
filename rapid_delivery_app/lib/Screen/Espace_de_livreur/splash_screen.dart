import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({super.key});

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rapid delivery'),
      ),
      body: Center(
        child: LottieBuilder.asset(
          'image/loading.json',
          width: 220,
          height: 220,
        ),
      ),
    );
  }
}
