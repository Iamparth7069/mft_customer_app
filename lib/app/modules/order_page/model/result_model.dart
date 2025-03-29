import 'order_model.dart';

class OrderResult {
  final List<Order> orders;
  final String orderTotal;

  OrderResult({
    required this.orders,
    required this.orderTotal,
  });

  factory OrderResult.fromJson(Map<String, dynamic> json) {
    var ordersList = json['orders'] as List<dynamic>?;
    List<Order> orders = ordersList != null
        ? ordersList.map((order) => Order.fromJson(order)).toList()
        : [];

    return OrderResult(
      orders: orders,
      orderTotal: json['order_total'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orders': orders.map((order) => order.toJson()).toList(),
      'order_total': orderTotal,
    };
  }
}
