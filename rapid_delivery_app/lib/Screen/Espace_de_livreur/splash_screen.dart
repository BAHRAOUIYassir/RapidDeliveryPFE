import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingSpashScreen extends StatefulWidget {
  const LoadingSpashScreen({super.key});

  @override
  State<LoadingSpashScreen> createState() => _LoadingSpashScreenState();
}

class _LoadingSpashScreenState extends State<LoadingSpashScreen> {
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
