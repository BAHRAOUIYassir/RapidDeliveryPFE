// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:rapid_delivery_app/widget/primary_button.dart';
// import '../widget/Text_widget.dart';
// import 'input_widget.dart';

// class Forget extends StatefulWidget {
//   const Forget({super.key});
//   @override
//   State<Forget> createState() => _ForgetState();
// }

// class _ForgetState extends State<Forget> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               toolbarHeight: 20,
//               elevation: 0,
//               backgroundColor: const Color.fromARGB(255, 88, 88,88), //Yassir:bash tweli backgroud noire chwiya b7al li f desgin
//               expandedHeight: 270.0,
//               pinned: true,
//               bottom: PreferredSize(
//                 preferredSize: const Size.fromHeight(0),
//                 child: Container(
//                   height: 20,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(25),
//                       topRight: Radius.circular(25),
//                     ),
//                   ),
//                 ),
//               ),
//               flexibleSpace: FlexibleSpaceBar(
//                 background: Stack(
//                   fit: StackFit.expand,
//                   alignment: Alignment.center,
//                   children: [
//                     Container(
//                       color: Colors.black38, //hada bax image ktwli kahla xwiya
//                       child: Image.asset(
//                         'image/livreur_men.png',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 40,
//                       child: Column(
//                         children: [
//                           text36(
//                               name: 'Mode passe oublie', color: Colors.white),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           text18(
//                               name: 'Nous avons envoyé un code à votre email',
//                               color: Colors.white,
//                               fontWeight: FontWeight.normal),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           text18(
//                               name: 'example@gmail.com',
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold)
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//                 child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 children: [
//                   const InputField(
//                     hint: "example@gmail.com",
//                     label: "EMAIL",
//                     obs: true,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const InputField(
//                     hint: "example@gmail.com",
//                     label: "EMAIL",
//                     obs: true,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   PrimaryButton(
//                     textbutton: 'envoye le code',
//                     textfontsize: 20,
//                     onPressed: () {},
//                     style: GoogleFonts.aBeeZee(
//                       textStyle: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       TextButton(onPressed: (){},
//                       child: const Text('Mot de passe oublié ?'))
//                     ],
//                   )
//                 ],
//               ),
              
//             )
            
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
