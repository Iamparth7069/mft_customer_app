class SimilarProducts {
  String productId;
  String productTag;
  String productType;
  String image;
  String name;
  String price;
  String special;
  String offerTags;
  String altTag;
  String expectedDelivery;
  String typeId;
  String type;

  SimilarProducts(
      {required this.productId,
        required this.productTag,
        required this.productType,
        required this.image,
        required this.name,
        required this.price,
        required this.special,
        required this.offerTags,
        required this.altTag,
        required this.expectedDelivery,
        required this.typeId,
        required this.type,
      });

  factory SimilarProducts.fromJson(Map<String, dynamic> json) {
    return SimilarProducts(
      productId: json['product_id'],
      productTag: json['product_tag'],
      productType: json['product_type'],
      image: json['image'],
      name: json['name'],
      price: json['price'],
      special: json['special'],
      offerTags: json['offer_tags'],
      altTag: json['alt_tag'],
      expectedDelivery: json['expected_delivery'],
      typeId: json['type_id'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_tag'] = productTag;
    data['product_type'] = productType;
    data['image'] = image;
    data['name'] = name;
    data['price'] = price;
    data['special'] = special;
    data['offer_tags'] = offerTags;
    data['alt_tag'] = altTag;
    data['expected_delivery'] = expectedDelivery;
    data['type_id'] = typeId;
    data['type'] = type;
    return data;
  }
}

class BestProducts {
  String? productId;
  String? productName;
  String? productTag;
  String? image;
  String? price;
  String? special;
  String? offerTags;
  String? typeId;
  String? type;
  String? productType;
  String? expectedDelivery;

  BestProducts(
      {this.productId,
        this.productName,
        this.productTag,
        this.image,
        this.price,
        this.special,
        this.offerTags,
        this.typeId,
        this.type,
        this.productType,
        this.expectedDelivery});

  BestProducts.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productTag = json['product_tag'];
    image = json['image'];
    price = json['price'];
    special = json['special'];
    offerTags = json['offer_tags'];
    typeId = json['type_id'];
    type = json['type'];
    productType = json['product_type'];
    expectedDelivery = json['expected_delivery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_tag'] = productTag;
    data['image'] = image;
    data['price'] = price;
    data['special'] = special;
    data['offer_tags'] = offerTags;
    data['type_id'] = typeId;
    data['type'] = type;
    data['product_type'] = productType;
    data['expected_delivery'] = expectedDelivery;
    return data;
  }
}

class Occasion {
  String categoryName;
  String smallText;
  String typeId;
  String type;
  String image;

  // Constructor
  Occasion({
    required this.categoryName,
    required this.smallText,
    required this.typeId,
    required this.type,
    required this.image,
  });

  // Convert a Occasion object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'category_name': categoryName,
      'small_text': smallText,
      'type_id': typeId,
      'type': type,
      'image': image,
    };
  }

  // Create an Occasion object from a Map object
  factory Occasion.fromMapMap(Map<String, dynamic> json) {
    return Occasion(
      categoryName: json['category_name'] ?? '',
      smallText: json['small_text'] ?? '',
      typeId: json['type_id'] ?? '',
      type: json['type'] ?? '',
      image: json['image'] ?? '',
    );
  }

}
