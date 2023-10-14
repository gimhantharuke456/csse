import 'package:cloud_firestore/cloud_firestore.dart';

class Site {
  final String? id;
  final String name;
  final String location;
  final double budget;
  final String? siteManagerId;
  Site({
    this.id,
    required this.name,
    required this.location,
    required this.budget,
    this.siteManagerId,
  });

  factory Site.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Site(
        id: snapshot.id,
        name: data['name'] ?? '',
        location: data['location'] ?? '',
        budget: (data['budget'] ?? 0.0).toDouble(),
        siteManagerId: data['siteManagerId']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'budget': budget,
      'siteManagerId': siteManagerId,
    };
  }
}
