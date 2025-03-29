class OrderDetails {
  final Result result;
  final String message;
  final bool status;

  OrderDetails({
    required this.result,
    required this.message,
    required this.status,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      result: Result.fromJson(json['result']),
      message: json['message'],
      status: json['status'],
    );
  }
}

class Result {
  final String orderId;
  final Express express;
  final Courier courier;
  final String awb;
  final String courierPartner;
  final List<OccasionBanner> occasionBanners;
  final List<GiftIdea> giftIdeas;

  Result({
    required this.orderId,
    required this.express,
    required this.courier,
    required this.awb,
    required this.courierPartner,
    required this.occasionBanners,
    required this.giftIdeas,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      orderId: json['order_id'],
      express: Express.fromJson(json['express']),
      courier: Courier.fromJson(json['courier']),
      awb: json['awb'],
      courierPartner: json['courier_partner'],
      occasionBanners: (json['occasion_banners'] as List)
          .map((item) => OccasionBanner.fromJson(item))
          .toList(),
      giftIdeas: (json['gift_ideas'] as List)
          .map((item) => GiftIdea.fromJson(item))
          .toList(),
    );
  }
}

class Express {
  final List<Product> products;
  final List<TrackingData> trackingData;

  Express({
    required this.products,
    required this.trackingData,
  });

  factory Express.fromJson(Map<String, dynamic> json) {
    return Express(
      products: (json['products'] as List)
          .map((item) => Product.fromJson(item))
          .toList(),
      trackingData: (json['tracking_data'] as List)
          .map((item) => TrackingData.fromJson(item))
          .toList(),
    );
  }
}

class Product {
  final String image;
  final String name;
  final String quantity;
  final String total;

  Product({
    required this.image,
    required this.name,
    required this.quantity,
    required this.total,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      image: json['image'],
      name: json['name'],
      quantity: json['quantity'],
      total: json['total'],
    );
  }
}

class TrackingData {
  final String date;
  final String message;
  final String classType;

  TrackingData({
    required this.date,
    required this.message,
    required this.classType,
  });

  factory TrackingData.fromJson(Map<String, dynamic> json) {
    return TrackingData(
      date: json['date'],
      message: json['message'],
      classType: json['class'],
    );
  }
}

class Courier {
  final List<Product> products;
  final List<TrackingData> trackingData;

  Courier({
    required this.products,
    required this.trackingData,
  });

  factory Courier.fromJson(Map<String, dynamic> json) {
    return Courier(
      products: (json['products'] as List)
          .map((item) => Product.fromJson(item))
          .toList(),
      trackingData: (json['tracking_data'] as List)
          .map((item) => TrackingData.fromJson(item))
          .toList(),
    );
  }
}

class OccasionBanner {
  final String type;
  final String typeId;
  final String image;

  OccasionBanner({
    required this.type,
    required this.typeId,
    required this.image,
  });

  factory OccasionBanner.fromJson(Map<String, dynamic> json) {
    return OccasionBanner(
      type: json['type'],
      typeId: json['type_id'],
      image: json['image'],
    );
  }
}

class GiftIdea {
  final String type;
  final String typeId;
  final String image;
  final String text;

  GiftIdea({
    required this.type,
    required this.typeId,
    required this.image,
    required this.text,
  });

  factory GiftIdea.fromJson(Map<String, dynamic> json) {
    return GiftIdea(
      type: json['type'],
      typeId: json['type_id'],
      image: json['image'],
      text: json['text'],
    );
  }
}
