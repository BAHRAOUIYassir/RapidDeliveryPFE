import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widget/Detail_commande_widget/timel_line_widget.dart';

class Detailcommande extends StatefulWidget {
  const Detailcommande({super.key});

  @override
  State<Detailcommande> createState() => _DetailcommandeState();
}

class _DetailcommandeState extends State<Detailcommande> {
  GoogleMapController? mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.white,
          title: const Text('Detail Commande',
              style: TextStyle(fontSize: 24, color: Colors.white)),
          backgroundColor: const Color(0xFFFF9800),
          actions: [
            PopupMenuButton(
              iconSize: 30,
              color: Colors.white,
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'Support',
                  child: Row(
                    children: [
                      Icon(Icons.support_agent, color: Color(0xffFF9800)),
                      SizedBox(width: 8),
                      Text('Support'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'History',
                  child: Row(
                    children: [
                      Icon(Icons.history, color: Color(0xffFF9800)),
                      SizedBox(width: 8),
                      Text('History'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.15,
              minChildSize: 0.15,
              maxChildSize: 0.55,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).hintColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 4,
                            width: 40,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Card(
                              color: Colors.white,
                              child: ListTile(
                                minLeadingWidth: 60,
                                leading: const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('image/Livreur.jpg'),
                                ),
                                title: const Text('salim laghrib',
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.black)),
                                subtitle: const Text('Rapid Delivery',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black26)),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        // Logique pour appeler
                                      },
                                      icon: const Icon(Icons.phone),
                                      color: Colors.green,
                                      iconSize: 40,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        // Logique pour WhatsApp
                                      },
                                      icon: const FaIcon(
                                          FontAwesomeIcons.whatsapp),
                                      color: Colors.green,
                                      iconSize: 40,
                                    ),
                                  ],
                                ),
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
