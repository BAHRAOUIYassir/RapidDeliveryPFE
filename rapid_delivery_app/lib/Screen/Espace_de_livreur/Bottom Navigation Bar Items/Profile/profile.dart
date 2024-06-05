import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var deliveryName = '';
  var deliveryId = '';

  final user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getDeliveryData() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      QuerySnapshot querySnapshot = await db
          .collection("users")
          .where("email", isEqualTo: user?.email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        setState(() {
          deliveryName = data['first name'] + ' ' + data['last name'];
        });

        log("Fetched delivery ID: $deliveryId");
      } else {
        log("No document found with the specified tracking number");
      }
    } catch (e) {
      log("Error fetching document ID in profile screen: $e");
    }
  }

  @override
  void initState() {
    
    getDeliveryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:const  EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 70,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            deliveryName,
                            style: const TextStyle(fontSize: 26),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Men Delivery",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black45),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: const Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person_outline_sharp,
                              color: Color(0xffFF9800),
                            ),
                          ),
                          title: Text("Personal Info"),
                          trailing: Icon(Icons.navigate_next_rounded),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.settings,
                              color: Color(0xFF413DFB),
                            ),
                          ),
                          title: Text("Settings"),
                          trailing: Icon(Icons.navigate_next_rounded),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(15),
              child: ListTile(
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: const Text("Are you sure"),
                      alignment: Alignment.center,
                      actions: [
                        TextButton(onPressed: _signOut, child: const Text('yes')),
                        TextButton(
                          child: const Text('cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                ),
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                ),
                title: const Text("Log Out"),
                trailing: const Icon(Icons.navigate_next_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, 'loginpage');
  }
}
