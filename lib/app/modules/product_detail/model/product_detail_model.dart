class ProductDetailModel {
  String? productType;
  String? noAddon;
  String? cutoff;
  String? messageOnCake;
  String? reviewTotal;
  String? catId;
  String? categoryTitle;
  String? parentCategory;
  String? type;
  String? productName;
  String? notificationText;
  String? productRating;
  int? productId;
  String? expectedDelivery;
  String? timer;
  String? timerLimit;
  String? earliestDeliveryDate;
  List<Images>? images;
  String? price;
  String? offerTags;
  String? special;
  List<Options>? options;
  String? reviews;
  int? rating;
  String? descriptionOne;
  String? descriptionTwo;
  String? altTag;
  List<ReviewList>? reviewList;
  String? sesskey;

  ProductDetailModel(
      {this.productType,
        this.noAddon,
        this.cutoff,
        this.messageOnCake,
        this.reviewTotal,
        this.catId,
        this.categoryTitle,
        this.parentCategory,
        this.type,
        this.productName,
        this.notificationText,
        this.productRating,
        this.productId,
        this.expectedDelivery,
        this.timer,
        this.timerLimit,
        this.earliestDeliveryDate,
        this.images,
        this.price,
        this.offerTags,
        this.special,
        this.options,
        this.reviews,
        this.rating,
        this.descriptionOne,
        this.descriptionTwo,
        this.altTag,
        this.reviewList,
        this.sesskey});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    productType = json['product_type'];
    noAddon = json['no_addon'];
    cutoff = json['cutoff'];
    messageOnCake = json['message_on_cake'];
    reviewTotal = json['review_total'];
    catId = json['catId'];
    categoryTitle = json['category_title'];
    parentCategory = json['parent_category'];
    type = json['type'];
    productName = json['product_name'];
    notificationText = json['notification_text'];
    productRating = json['product_rating'];
    productId = json['product_id'];
    expectedDelivery = json['expected_delivery'].toString();
    timer = json['timer'];
    timerLimit = json['timer_limit'];
    earliestDeliveryDate = json['earliest_delivery_date'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    price = json['price'];
    offerTags = json['offer_tags'];
    special = json['special'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
    reviews = json['reviews'];
    rating = json['rating'];
    descriptionOne = json['description_one'];
    descriptionTwo = json['description_two'];
    altTag = json['alt_tag'];
    if (json['review_list'] != null) {
      reviewList = <ReviewList>[];
      json['review_list'].forEach((v) {
        reviewList!.add(ReviewList.fromJson(v));
      });
    }
    sesskey = json['sesskey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_type'] = productType;
    data['no_addon'] = noAddon;
    data['cutoff'] = cutoff;
    data['message_on_cake'] = messageOnCake;
    data['review_total'] = reviewTotal;
    data['catId'] = catId;
    data['category_title'] = categoryTitle;
    data['parent_category'] = parentCategory;
    data['type'] = type;
    data['product_name'] = productName;
    data['notification_text'] = notificationText;
    data['product_rating'] = productRating;
    data['product_id'] = productId;
    data['expected_delivery'] = expectedDelivery;
    data['timer'] = timer;
    data['timer_limit'] = timerLimit;
    data['earliest_delivery_date'] = earliestDeliveryDate;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['price'] = price;
    data['offer_tags'] = offerTags;
    data['special'] = special;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    data['reviews'] = reviews;
    data['rating'] = rating;
    data['description_one'] = descriptionOne;
    data['description_two'] = descriptionTwo;
    data['alt_tag'] = altTag;
    if (reviewList != null) {
      data['review_list'] = reviewList!.map((v) => v.toJson()).toList();
    }
    data['sesskey'] = sesskey;
    return data;
  }
}

class Images {
  String? image;

  Images({this.image});

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    return data;
  }
}

class Options {
  String? name;
  String? type;
  List<OptionValues>? optionValues;

  Options({this.name, this.type, this.optionValues});

  Options.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    if (json['option_values'] != null) {
      optionValues = <OptionValues>[];
      json['option_values'].forEach((v) {
        optionValues!.add(OptionValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    if (optionValues != null) {
      data['option_values'] =
          optionValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OptionValues {
  String? id;
  String? text;

  OptionValues({this.id, this.text});

  OptionValues.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    return data;
  }
}

class ReviewList {
  String? author;
  String? rating;
  String? text;
  String? date;

  ReviewList({this.author, this.rating, this.text, this.date});

  ReviewList.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    rating = json['rating'];
    text = json['text'] ?? '';
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['rating'] = rating;
    data['text'] = text;
    data['date'] = date;
    return data;
  }
}