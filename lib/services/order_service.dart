import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csse/models/add_order_model.dart';
import 'package:csse/utils/collection_names.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderService {
  final _firestore = FirebaseFirestore.instance;
  Future<void> addOrder(OrderModel order) async {
    try {
      await _firestore.collection(orderCollection).add(order.toJson());
    } catch (e) {
      throw Error.safeToString(e);
    }
  }

  Future<List<OrderModel>> getOrders() async {
    try {
      return await _firestore
          .collection(orderCollection)
          .where('requestedBy',
              isEqualTo: FirebaseAuth.instance.currentUser?.email)
          .get()
          .then((value) {
        return value.docs
            .map((e) => OrderModel.fromDocumentSnapshot(e))
            .toList();
      });
    } catch (e) {
      throw Error.safeToString(e);
    }
  }
}
