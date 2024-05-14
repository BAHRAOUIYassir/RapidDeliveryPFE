import 'package:flutter/material.dart';
import 'package:rapid_delivery_app/Screen/Espace_de_livreur/login_screen.dart';

class SignUpSuccessfuly extends StatefulWidget {
  const SignUpSuccessfuly({super.key});

  @override
  State<SignUpSuccessfuly> createState() => _SignUpSuccessfulyState();
}

class _SignUpSuccessfulyState extends State<SignUpSuccessfuly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Text("You are successfully signed up"),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginScreen()),
              );
            },
            child: const Text('Click here'))
      ],
    ));
  }
}
