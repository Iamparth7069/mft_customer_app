class WishList {
  String? productName;
  String? productTag;
  String? image;
  String? price;
  String? special;
  String? offerTags;
  String? typeId;
  String? type;
  String? rating;
  String? productType;
  String? expectedDelivery;
  String? productId;

  WishList(
      {this.productName,
        this.productTag,
        this.image,
        this.price,
        this.special,
        this.offerTags,
        this.typeId,
        this.type,
        this.rating,
        this.productType,
        this.expectedDelivery,
        this.productId,
      });

  WishList.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    productTag = json['product_tag'];
    image = json['image'];
    price = json['price'];
    special = json['special'];
    offerTags = json['offer_tags'];
    typeId = json['type_id'].toString();
    type = json['type'];
    rating = json['rating'];
    productType = json['product_type'];
    expectedDelivery = json['expected_delivery'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_name'] = productName;
    data['product_tag'] = productTag;
    data['image'] = image;
    data['price'] = price;
    data['special'] = special;
    data['offer_tags'] = offerTags;
    data['type_id'] = typeId;
    data['type'] = type;
    data['rating'] = rating;
    data['product_type'] = productType;
    data['expected_delivery'] = expectedDelivery;
    data['product_id'] = productId;
    return data;
  }
}