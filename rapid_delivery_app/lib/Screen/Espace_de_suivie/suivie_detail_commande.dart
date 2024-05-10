import 'package:flutter/material.dart';
import 'package:rapid_delivery_app/widget/Detail_commande_widget/timel_line_widget.dart';
import 'package:rapid_delivery_app/widget/text_widget.dart';

class Detailcommande extends StatelessWidget {
  const Detailcommande({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.white,
          title: text24(name: "Detail Commande", color: Colors.white),
          backgroundColor: const Color(0xFFFF9800),
          actions: [
            PopupMenuButton(
              iconSize: 30,
              color: Colors.white,
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: '1',
                  child: Row(
                    children: [
                      Icon(
                        Icons.support_agent,
                        color: Color(0xffFF9800),
                      ), // Ajout de l'icône de support
                      SizedBox(width: 8), // Espacement
                      Text('Support'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: '1',
                  child: Row(
                    children: [
                      Icon(
                        Icons.history,
                        color: Color(0xffFF9800),
                      ), // Ajout de l'icône de support
                      SizedBox(width: 8), // Espacement
                      Text('History'),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              toolbarHeight: 10,
              expandedHeight: 500,
              flexibleSpace: FlexibleSpaceBar(
                background: Image(
                  image: AssetImage('image/Maps_carte.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                const SizedBox(
                    height: 30,
                    width: 60,
                    child: Divider(
                      color: Colors.black26,
                      thickness: 3,
                    )),
                Card(
                  color: Colors.white,
                  child: ListTile(
                    minLeadingWidth: 60,
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('image/Livreur.jpg'),
                    ),
                    title: text24(name: "salim laghrib", color: Colors.black),
                    subtitle:
                        text18(name: "Rapid Delivery", color: Colors.black26),
                    trailing: const Icon(Icons.phone),
                  ),
                ),
                const SizedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        MyTimeLineTile(
                          isFirst: true,
                          isPast: true,
                          isLast: false,
                          NameStatus: 'Preparing for shipping',
                          Date_staus: '13/07/2023',
                          path: 'image/en-cours.png',
                        ),
                        MyTimeLineTile(
                          isFirst: false,
                          isPast: true,
                          isLast: false,
                          NameStatus: 'In the process of delivery',
                          Date_staus: '14/07/2023',
                          path: 'image/livreur.png',
                        ),
                        MyTimeLineTile(
                          isFirst: false,
                          isPast: true,
                          isLast: true,
                          NameStatus: 'Delivered',
                          Date_staus: '15/07/2023',
                          path: 'image/delivery.png',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
