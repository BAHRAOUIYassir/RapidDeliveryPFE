
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('image/login_background.png'),
                fit: BoxFit.cover, // adjust as per your needs
              ),
            ),
          ),
        ],
      ),
    );
  }
}