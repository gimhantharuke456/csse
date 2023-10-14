import 'package:csse/models/order_model.dart';
import 'package:csse/services/api_handler.dart';

class OrderService {
  final ApiHandler _apiHandler = ApiHandler('YOUR_BACKEND_BASE_URL');

  Future<void> addOrder(OrderModel order) async {
    try {
      await _apiHandler.post('supply-requests', order.toMap());
    } catch (e) {
      throw Error.safeToString(e);
    }
  }

  Future<List<OrderModel>> getOrders() async {
    try {
      final response = await _apiHandler.get('supply-requests');
      return (response as List)
          .map((item) => OrderModel.fromMap(item))
          .toList();
    } catch (e) {
      throw Error.safeToString(e);
    }
  }

  Future<void> updateOrder(OrderModel order) async {
    try {
      await _apiHandler.put('supply-requests/${order.id}', order.toMap());
    } catch (e) {
      throw Error.safeToString(e);
    }
  }

  Future<void> deleteOrder(OrderModel orderModel) async {
    try {
      await _apiHandler.delete('supply-requests/${orderModel.id}');
    } catch (e) {
      throw Error.safeToString(e);
    }
  }
}
