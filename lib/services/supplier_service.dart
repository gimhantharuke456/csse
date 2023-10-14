import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csse/models/product_model.dart';
import 'package:csse/models/supplier_model.dart';
import 'package:csse/utils/collection_names.dart';

class SupplierService {
  final _firestore = FirebaseFirestore.instance;

  Future<List<SupplierModel>> getSuppliers() async {
    try {
      List<SupplierModel> suppliers = [];
      await _firestore.collection(supplierCollection).get().then((value) {
        suppliers = value.docs.map((e) {
          return SupplierModel.fromDocumentSnapshot(e);
        }).toList();
      });
      return suppliers;
    } catch (e) {
      throw Error.safeToString(e);
    }
  }

  Future<List<Product>> getSupplierProducts(String id) async {
    try {
      return await _firestore
          .collection(supplierCollection)
          .doc(id)
          .collection(itemsCollection)
          .get()
          .then((value) {
        return value.docs.map((e) => Product.fromDocumentSnapshot(e)).toList();
      });
    } catch (e) {
      throw Error.safeToString(e);
    }
  }
}
