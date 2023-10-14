import 'package:csse/models/add_order_model.dart';
import 'package:csse/providers/add_order_provider.dart';
import 'package:csse/utils/constants.dart';
import 'package:csse/utils/index.dart';
import 'package:csse/views/order/order_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  const OrderCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final AddOrderProvider addOrderProvider =
        Provider.of<AddOrderProvider>(context);
    return GestureDetector(
      onTap: () {
        addOrderProvider.setDeliveryDetails(
          requestedBy: order.requestedBy,
          requestedTo: order.supplier,
          siteId: order.siteId,
          deliveryDate: order.requesingDate,
          address: order.address,
          contactNumber: order.contactNumber,
        );
        addOrderProvider.orderModel.items = order.items;
        List<Map> items = order.items
            .map(
              (e) => e.toJson(),
            )
            .toList();
        double total = 0.0;
        try {
          for (Map product in items) {
            total += (product['price'] * int.parse(product['qty'].toString()));
          }
        } catch (e) {
          Logger().e(e);
        }
        context.navigator(
          context,
          OrderView(
            status: order.status,
            haveToCreate: false,
            orders: items,
            totalPrice: total,
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(defaultPadding / 2),
        margin: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  backgroundColor: orderStateColors(order.status),
                  label: Text(
                    order.status.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Chip(
                  backgroundColor: lightGrey,
                  label: Text(
                    DateFormat('yyyy-MM-dd').format(order.requesingDate),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Order : ${order.id}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Supplier : ${order.supplier}',
                  style: const TextStyle(
                    fontSize: 11,
                    color: darkGrey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
