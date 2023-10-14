import 'package:cloud_firestore/cloud_firestore.dart';

class SupplierModel {
  final String? id;
  final String email;
  final String contactNumber;
  final String businessName;
  final String businessAddress;

  SupplierModel({
    this.id,
    required this.email,
    required this.contactNumber,
    required this.businessName,
    required this.businessAddress,
  });

  factory SupplierModel.fromDocumentSnapshot(DocumentSnapshot map) {
    return SupplierModel(
      id: map.id,
      email: (map.data() as Map)['email'] ?? '',
      contactNumber: (map.data() as Map)['contactNumber'] ?? '',
      businessName: (map.data() as Map)['businessName'] ?? '',
      businessAddress: (map.data() as Map)['businessAddress'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'contactNumber': contactNumber,
      'businessName': businessName,
      'businessAddress': businessAddress,
    };
  }
}
