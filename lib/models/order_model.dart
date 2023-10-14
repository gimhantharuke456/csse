import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  final String? id;
  final String siteId;
  final String supplierId;
  final List<String> products;
  final DateTime orderDate;
  final DateTime deliveryDate;
  final String status;

  Order({
    this.id,
    required this.siteId,
    required this.supplierId,
    required this.products,
    required this.orderDate,
    required this.deliveryDate,
    required this.status,
  });

  factory Order.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Order(
      id: snapshot.id,
      siteId: data['siteId'] ?? '',
      supplierId: data['supplierId'] ?? '',
      products: List<String>.from(data['products'] ?? []),
      orderDate: data['orderDate'].toDate(),
      deliveryDate: data['deliveryDate'].toDate(),
      status: data['status'] ?? 'pending',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'siteId': siteId,
      'supplierId': supplierId,
      'products': products,
      'orderDate': orderDate,
      'deliveryDate': deliveryDate,
      'status': status,
    };
  }
}
