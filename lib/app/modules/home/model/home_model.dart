class HomeModel {
  String? exploreNowTimer;
  List<HomeImages>? banners;
  List<HomeImages>? homeImages;
  List<HomeImages>? shopByGender;
  ShopByCategoriesText? shopByCategoriesText;
  List<ShopByCategories>? shopByCategories;
  ShopByCategoriesText? shopByOccasionText;
  List<ShopByCategories>? shopByOccasions;
  List<ShopByCategories>? youMayAlsoLike;
  List<Products>? bestSeller;
  List<HomeImages>? plantVibes;
  List<HomeImages>? internationalCategory;
  ShopByCategoriesText? bottomText;

  HomeModel(
      {this.exploreNowTimer,
        this.banners,
        this.homeImages,
        this.shopByGender,
        this.shopByCategoriesText,
        this.shopByCategories,
        this.shopByOccasionText,
        this.shopByOccasions,
        this.youMayAlsoLike,
        this.bestSeller,
        this.plantVibes,
        this.internationalCategory,
        this.bottomText,
      });

  HomeModel.fromJson(Map<String, dynamic> json) {
    exploreNowTimer = json['explore_now_timer'];
    if (json['category_top_images'] != null) {
      homeImages = <HomeImages>[];
      json['category_top_images'].forEach((v) {
        homeImages!.add(HomeImages.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = <HomeImages>[];
      json['banners'].forEach((v) {
        banners!.add(HomeImages.fromJson(v));
      });
    }
    if (json['shop_by_gender'] != null) {
      shopByGender = <HomeImages>[];
      json['shop_by_gender'].forEach((v) {
        shopByGender!.add(HomeImages.fromJson(v));
      });
    }
    shopByCategoriesText = json['shop_by_categories_text'] != null
        ? ShopByCategoriesText.fromJson(json['shop_by_categories_text'])
        : null;
    if (json['shop_by_categories'] != null) {
      shopByCategories = <ShopByCategories>[];
      json['shop_by_categories'].forEach((v) {
        shopByCategories!.add(ShopByCategories.fromJson(v));
      });
    }
    shopByOccasionText = json['shop_by_occasion_text'] != null
        ? ShopByCategoriesText.fromJson(json['shop_by_occasion_text'])
        : null;
    if (json['shop_by_occasion'] != null) {
      shopByOccasions = <ShopByCategories>[];
      json['shop_by_occasion'].forEach((v) {
        shopByOccasions!.add(ShopByCategories.fromJson(v));
      });
    }
    if (json['youMayAlsoLike'] != null) {
      youMayAlsoLike = <ShopByCategories>[];
      json['youMayAlsoLike'].forEach((v) {
        youMayAlsoLike!.add(ShopByCategories.fromJson(v));
      });
    }
    if (json['best_seller'] != null) {
      bestSeller = <Products>[];
      json['best_seller'].forEach((v) {
        bestSeller!.add(Products.fromJson(v));
      });
    }
    if (json['plant_vibes'] != null) {
      plantVibes = <HomeImages>[];
      json['plant_vibes'].forEach((v) {
        plantVibes!.add(HomeImages.fromJson(v));
      });
    }
    if (json['internationalCategory'] != null) {
      internationalCategory = <HomeImages>[];
      json['internationalCategory'].forEach((v) {
        internationalCategory!.add(HomeImages.fromJson(v));
      });
    }
    bottomText = json['bottom_text'] != null
        ? ShopByCategoriesText.fromJson(json['bottom_text'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['explore_now_timer'] = exploreNowTimer;
    if (banners != null) {
      data['banners'] = banners!.map((v) => v.toJson()).toList();
    }
    if (homeImages != null) {
      data['category_top_images'] = homeImages!.map((v) => v.toJson()).toList();
    }
    if (shopByGender != null) {
      data['shop_by_gender'] =
          shopByGender!.map((v) => v.toJson()).toList();
    }
    if (shopByCategoriesText != null) {
      data['shop_by_categories_text'] = shopByCategoriesText!.toJson();
    }
    if (shopByCategories != null) {
      data['shop_by_categories'] =
          shopByCategories!.map((v) => v.toJson()).toList();
    }
    if (shopByOccasionText != null) {
      data['shop_by_occasion_text'] = shopByOccasionText!.toJson();
    }
    if (youMayAlsoLike != null) {
      data['youMayAlsoLike'] =
          youMayAlsoLike!.map((v) => v.toJson()).toList();
    }
    if (bestSeller != null) {
      data['best_seller'] = bestSeller!.map((v) => v.toJson()).toList();
    }
    if (plantVibes != null) {
      data['plant_vibes'] = plantVibes!.map((v) => v.toJson()).toList();
    }
    if (internationalCategory != null) {
      data['internationalCategory'] = internationalCategory!.map((v) => v.toJson()).toList();
    }
    if (bottomText != null) {
      data['bottom_text'] = bottomText!.toJson();
    }
    return data;
  }
}

class HomeImages {
  String categoryName;
  String typeId;
  String type;
  String image;

  HomeImages({
    required this.categoryName,
    required this.typeId,
    required this.type,
    required this.image,
  });

  factory HomeImages.fromJson(Map<String, dynamic> json) {
    return HomeImages(
      categoryName: json['category_name'],
      typeId: json['type_id'],
      type: json['type'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_name'] = categoryName;
    data['type_id'] = typeId;
    data['type'] = type;
    data['image'] = image;
    return data;
  }
}

class ShopByCategoriesText {
  String title;
  String description;
  String image;
  String bottomText;
  String typeId;
  String type;

  ShopByCategoriesText({
    required this.title,
    required this.description,
    required this.image,
    required this.bottomText,
    required this.typeId,
    required this.type,
  });

  factory ShopByCategoriesText.fromJson(Map<String, dynamic> json) {
    return ShopByCategoriesText(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      bottomText: json['bottom_text'],
      typeId: json['type_id'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['bottom_text'] = bottomText;
    data['type_id'] = typeId;
    data['type'] = type;
    return data;
  }
}

class ShopByCategories {
  String? categoryName;
  String? typeId;
  String? type;
  List<Products>? products;

  ShopByCategories({this.categoryName, this.typeId, this.type, this.products});

  ShopByCategories.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    typeId = json['type_id'];
    type = json['type'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_name'] = categoryName;
    data['type_id'] = typeId;
    data['type'] = type;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String productName;
  String productTag;
  String image;
  String price;
  String special;
  String offerTags;
  String typeId;
  String type;
  String productType;
  String rating;
  String expectedDelivery;
  String productId;
  String wishListProduct;
  String tagClass;

  Products({
    required this.productName,
    required this.productTag,
    required this.image,
    required this.price,
    required this.special,
    required this.offerTags,
    required this.typeId,
    required this.type,
    required this.productType,
    required this.rating,
    required this.expectedDelivery,
    required this.productId,
    required this.wishListProduct,
    required this.tagClass,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      productName: json['product_name'] ?? "",
      productTag: json['product_tag'],
      image: json['image'],
      price: json['price'],
      special: json['special'],
      offerTags: json['offer_tags'],
      typeId: json['type_id'],
      type: json['type'],
      productType: json['product_type'],
      rating: json['rating'] ?? "",
      expectedDelivery: json['expected_delivery'],
      productId: json['product_id'],
      wishListProduct: json['wishlistproduct'],
      tagClass: json['tag_class'],
    );
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
    data['product_type'] = productType;
    data['rating'] = rating;
    data['expected_delivery'] = expectedDelivery;
    data['product_id'] = productId;
    data['wishlistproduct'] = wishListProduct;
    data['tag_class'] = tagClass;
    return data;
  }
}

class Testimonials {
  String reviewId;
  String author;
  String rating;
  String text;
  String productId;
  String dateAdded;

  Testimonials(
      {
        required this.reviewId,
        required this.author,
        required this.rating,
        required this.text,
        required this.productId,
        required this.dateAdded,
      });

  factory Testimonials.fromJson(Map<String, dynamic> json) {
    return Testimonials(
      reviewId: json['review_id'],
      author: json['author'],
      rating: json['rating'],
      text: json['text'],
      productId: json['product_id'],
      dateAdded: json['date_added'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['review_id'] = reviewId;
    data['author'] = author;
    data['rating'] = rating;
    data['text'] = text;
    data['product_id'] = productId;
    data['date_added'] = dateAdded;
    return data;
  }
}
