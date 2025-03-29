class CartData {

  Result? result;
  bool? status;
  String? message;

  CartData({
      this.result, 
      this.status, 
      this.message,});

  CartData.fromJson(dynamic json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    status = json['status'];
    message = json['message'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.toJson();
    }
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}

class Result {
  List<Products>? products;
  List<Totals>? totals;
  FilterTotal? filterTotal;

  Result({
      this.products, 
      this.totals, 
      this.filterTotal,});

  Result.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    if (json['totals'] != null) {
      totals = [];
      json['totals'].forEach((v) {
        totals?.add(Totals.fromJson(v));
      });
    }
    filterTotal = json['filter_total'] != null ? FilterTotal.fromJson(json['filter_total']) : null;
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    if (totals != null) {
      map['totals'] = totals?.map((v) => v.toJson()).toList();
    }
    if (filterTotal != null) {
      map['filter_total'] = filterTotal?.toJson();
    }
    return map;
  }

}

class FilterTotal {
  int? subtotal;
  int? total;

  FilterTotal({
      this.subtotal, 
      this.total,});

  FilterTotal.fromJson(dynamic json) {
    subtotal = json['subtotal'];
    total = json['total'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subtotal'] = subtotal;
    map['total'] = total;
    return map;
  }

}

class Totals {
  Totals({
      this.title, 
      this.text,});

  Totals.fromJson(dynamic json) {
    title = json['title'];
    text = json['text'];
  }
  String? title;
  String? text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['text'] = text;
    return map;
  }

}

class Products {

  String? cartId;
  String? key;
  String? productId;
  String? productType;
  String? name;
  List<Option>? option;
  String? quantity;
  String? price;
  String? addon;
  String? total;
  String? typeId;
  String? type;
  String? image;
  String? rating;

  Products({
    this.cartId,
    this.key,
    this.productId,
    this.productType,
    this.name,
    this.option,
    this.quantity,
    this.price,
    this.addon,
    this.total,
    this.typeId,
    this.type,
    this.image,
    this.rating,
  });

  Products.fromJson(dynamic json) {
    cartId = json['cart_id'];
    key = json['key'];
    productId = json['product_id'];
    productType = json['product_type'];
    name = json['name'];
    if (json['option'] != null) {
      option = [];
      json['option'].forEach((v) {
        option?.add(Option.fromJson(v));
      });
    }
    quantity = json['quantity'];
    price = json['price'];
    addon = json['addon'];
    total = json['total'];
    typeId = json['type_id'];
    type = json['type'];
    image = json['image'];
    rating = json['rating'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cart_id'] = cartId;
    map['key'] = key;
    map['product_id'] = productId;
    map['product_type'] = productType;
    map['name'] = name;
    if (option != null) {
      map['option'] = option?.map((v) => v.toJson()).toList();
    }
    map['quantity'] = quantity;
    map['price'] = price;
    map['addon'] = addon;
    map['total'] = total;
    map['type_id'] = typeId;
    map['type'] = type;
    map['image'] = image;
    map['rating'] = rating;
    return map;
  }

}

class Option {
  String? name;
  String? type;
  Option({
      this.name, 
      this.type,});

  Option.fromJson(dynamic json) {
    name = json['name'];
    type = json['type'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['type'] = type;
    return map;
  }

}