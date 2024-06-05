import 'package:cloud_firestore/cloud_firestore.dart';

class Commande {
  final String id;
  final double amountToBePaid;
  final String commandeDate;
  final double commandeProfit;
  final String commandeStatus;
  final String customerName;
  final int customerPhoneNumber;
  final String deliveryAddress;
  final int deliveryID;
  final String trackingNumber;
  bool isSelected;

  Commande({
    required this.id,
    required this.amountToBePaid,
    required this.commandeDate,
    required this.commandeProfit,
    required this.commandeStatus,
    required this.customerName,
    required this.customerPhoneNumber,
    required this.deliveryAddress,
    required this.deliveryID,
    required this.trackingNumber,
    this.isSelected = false,
  });

  factory Commande.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Commande(
      id: doc.id,
      amountToBePaid: data['amount to be paid'].toDouble(),
      commandeDate: data['commande date'],
      commandeProfit: data['commande profit'].toDouble(),
      commandeStatus: data['commande status'],
      customerName: data['customer name'] ?? '',
      customerPhoneNumber: data['customer phone number'],
      deliveryAddress: data['delivery address'] ?? '',
      deliveryID: data['deliveryID'],
      trackingNumber: data['tracking number'],
    );
  }
}
