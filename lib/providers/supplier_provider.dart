import 'package:csse/models/supplier_model.dart';
import 'package:flutter/material.dart';

class SupplierProvider with ChangeNotifier {
  List<SupplierModel> _suppliers = [];
  List<SupplierModel> get suppliers => _suppliers;

  void setSuppliers(List<SupplierModel> value) {
    _suppliers = value;
    notifyListeners();
  }
}
