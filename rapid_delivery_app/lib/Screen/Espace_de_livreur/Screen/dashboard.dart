import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xffFF9800),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: box(
                    color: const Color.fromARGB(255, 105, 221, 94),
                    titre: "Order Today",
                    valeur: '20',
                    icon: FontAwesomeIcons.box,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: box(
                    color: const Color(0xffDD99FD),
                    titre: "All Order",
                    valeur: '150',
                    icon: FontAwesomeIcons.listAlt,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: box(
                    color: const Color(0xffFFB23E),
                    titre: "Balance",
                    valeur: '90 Dh',
                    icon: FontAwesomeIcons.dollarSign,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: box(
                    color: const Color(0xff93C5FF),
                    titre: "Total Earning",
                    valeur: '850.00 Dh',
                    icon: FontAwesomeIcons.wallet,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container box(
      {required Color color,
      required String titre,
      required String valeur,
      required IconData icon}) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titre,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  valeur,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          FaIcon(
            icon,
            size: 50,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Dashboard(),
  ));
}
