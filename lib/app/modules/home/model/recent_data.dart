class RecentData {
  final String productId;
  final String productTag;
  final String wishListProduct;
  final String image;
  final String productType;
  final String name;
  final String price;
  final String expectedDelivery;
  final String special;
  final String offerTags;
  final String typeId;
  final String type;
  final String tagClass;

  RecentData({
    required this.productId,
    required this.productTag,
    required this.wishListProduct,
    required this.image,
    required this.productType,
    required this.name,
    required this.price,
    required this.expectedDelivery,
    required this.special,
    required this.offerTags,
    required this.typeId,
    required this.type,
    required this.tagClass,
  });

  // Factory constructor to create a Product from a JSON object
  factory RecentData.fromJson(Map<String, dynamic> json) {
    return RecentData(
      productId: json['product_id'] ?? '',
      productTag: json['product_tag'] ?? '',
      wishListProduct: json['wishlistproduct'] ?? '',
      image: json['image'] ?? '',
      productType: json['product_type'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? '',
      expectedDelivery: json['expected_delivery'] ?? '',
      special: json['special'] ?? '',
      offerTags: json['offer_tags'] ?? '',
      typeId: json['type_id'] ?? '',
      type: json['type'] ?? '',
      tagClass: json['tag_class'] ?? '',
    );
  }

  // Method to convert a Product object into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_tag': productTag,
      'wishlistproduct': wishListProduct,
      'image': image,
      'product_type': productType,
      'name': name,
      'price': price,
      'expected_delivery': expectedDelivery,
      'special': special,
      'offer_tags': offerTags,
      'type_id': typeId,
      'type': type,
      'tag_class': tagClass,
    };
  }
}
