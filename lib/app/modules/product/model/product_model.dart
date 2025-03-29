class ProductsModel {
  String productId;
  String productTag;
  String image;
  String productType;
  String name;
  String price;
  String expectedDelivery;
  String special;
  String rating;
  String reviewTotal;
  String proCont;
  String typeId;
  String type;
  String wishListProduct;
  String tagClass;
  int qty;

  ProductsModel(
      {required this.productId,
        required this.productTag,
        required this.image,
        required this.productType,
        required this.name,
        required this.price,
        required this.expectedDelivery,
        required this.special,
        required this.rating,
        required this.reviewTotal,
        required this.proCont,
        required this.typeId,
        required this.type,
        required this.wishListProduct,
        required this.tagClass,
        this.qty = 1,
      });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      productId: json['product_id'],
      productTag: json['product_tag'],
      image: json['image'],
      productType: json['product_type'],
      name: json['name'],
      price: json['price'],
      expectedDelivery: json['expected_delivery'],
      special: json['special'],
      rating: json['rating'],
      reviewTotal: json['review_total'],
      proCont: json['proCont'] ?? "",
      typeId: json['type_id'],
      wishListProduct: json['wishlistproduct'],
      tagClass: json['tag_class'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_tag'] = productTag;
    data['image'] = image;
    data['product_type'] = productType;
    data['name'] = name;
    data['price'] = price;
    data['expected_delivery'] = expectedDelivery;
    data['special'] = special;
    data['rating'] = rating;
    data['review_total'] = reviewTotal;
    data['proCont'] = proCont;
    data['type_id'] = typeId;
    data['wishlistproduct'] = wishListProduct;
    data['tag_class'] = tagClass;
    data['type'] = type;
    return data;
  }
}
