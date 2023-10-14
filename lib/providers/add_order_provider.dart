import 'package:csse/models/add_order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddOrderProvider with ChangeNotifier {
  OrderModel orderModel = OrderModel(
    requestedBy: '',
    siteId: '',
    supplier: '',
    requesingDate: DateTime.now(),
    address: '',
    contactNumber: '',
    items: [],
  );

  void setDeliveryDetails({
    required String requestedBy,
    required String requestedTo,
    required String siteId,
    required DateTime deliveryDate,
    required String address,
    required String contactNumber,
  }) {
    orderModel.setAddress = address;
    orderModel.setContactNumber = contactNumber;
    orderModel.setSuppler = requestedTo;
    orderModel.setRequesingDate = deliveryDate;
    orderModel.setSiteId = siteId;
    orderModel.requestedBy = FirebaseAuth.instance.currentUser?.email ?? '';
    notifyListeners();
  }

  void clearOrder() {
    orderModel;
    notifyListeners();
  }
}
