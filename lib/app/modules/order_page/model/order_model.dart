class Order {
  final String orderId;
  final String image;
  final String productName;
  final String status;
  final String date;
  final String price;
  final List<dynamic> productOptions;
  final String type;
  final String typeId;

  Order({
    required this.orderId,
    required this.image,
    required this.productName,
    required this.status,
    required this.date,
    required this.price,
    required this.productOptions,
    required this.type,
    required this.typeId,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['order_id'] ?? '',
      image: json['image'] ?? '',
      productName: json['product_name'] ?? '',
      status: json['status'] ?? '',
      date: json['date'] ?? '',
      price: json['price'] ?? '',
      productOptions: json['product_options'] ?? [],
      type: json['type'] ?? '',
      typeId: json['type_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderId,
      'image': image,
      'product_name': productName,
      'status': status,
      'date': date,
      'price': price,
      'product_options': productOptions,
      'type': type,
      'type_id': typeId,
    };
  }
}
