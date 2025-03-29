class AddsOnModel {
  int? totalProducts;
  String? totalAmount;
  String? sesskey;
  List<ProductOptions>? productOptions;
  AddOnProducts? addOnProducts;

  AddsOnModel({
    this.productOptions,
    this.totalProducts,
    this.totalAmount,
    this.sesskey,
    this.addOnProducts,
  });

  AddsOnModel.fromJson(Map<String, dynamic> json) {
    if (json['product_options'] != null) {
      productOptions = <ProductOptions>[];
      json['product_options'].forEach((v) { productOptions!.add(ProductOptions.fromJson(v)); });
    }
    totalProducts = json['total_products'];
    totalAmount = json['total_amount'];
    sesskey = json['sesskey'];
    addOnProducts = json['addOnProducts'] != null ? AddOnProducts.fromJson(json['addOnProducts']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_products'] = totalProducts;
    data['total_amount'] = totalAmount;
    data['sesskey'] = sesskey;
    if (productOptions != null) {
      data['product_options'] = productOptions!.map((v) => v.toJson()).toList();
    }
    if (addOnProducts != null) {
      data['addOnProducts'] = addOnProducts!.toJson();
    }
    return data;
  }

}

class ProductOptions {
  String? name;
  String? price;

  ProductOptions({this.name, this.price});

  ProductOptions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}

class AddOnProducts {
  String? continueImage;
  String? gotocart;
  List<AddonProducts>? addonProducts;
  String? productType;
  ProductDetail? productDetail;

  AddOnProducts({this.continueImage, this.gotocart, this.addonProducts, this.productType, this.productDetail});

  AddOnProducts.fromJson(Map<String, dynamic> json) {
    continueImage = json['continue'];
    gotocart = json['gotocart'];
    if (json['addonProducts'] != null) {
    addonProducts = <AddonProducts>[];
    json['addonProducts'].forEach((v) { addonProducts!.add(AddonProducts.fromJson(v)); });
    }
    productType = json['product_type'];
    productDetail = json['productDetail'] != null ? ProductDetail.fromJson(json['productDetail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['continue'] = continueImage;
    data['gotocart'] = gotocart;
    if (addonProducts != null) {
    data['addonProducts'] = addonProducts!.map((v) => v.toJson()).toList();
    }
    data['product_type'] = productType;
    if (productDetail != null) {
    data['productDetail'] = productDetail!.toJson();
    }
    return data;
  }
}

class AddonProducts {
  String? title;
  List<Data>? data;

  AddonProducts({this.title, this.data});

  AddonProducts.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) { data!.add(Data.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? productId;
  String? thumb;
  String? name;
  String? price;
  bool isAdded = false;

  Data({this.productId, this.thumb, this.name, this.price, this.isAdded = false});

  Data.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    thumb = json['thumb'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['thumb'] = thumb;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}


class ProductDetail {
  String? productName;
  String? image;
  String? expectedDelivery;

  ProductDetail({this.productName, this.image, this.expectedDelivery});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    image = json['image'];
    expectedDelivery = json['expected_delivery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_name'] = productName;
    data['image'] = image;
    data['expected_delivery'] = expectedDelivery;
    return data;
  }
}