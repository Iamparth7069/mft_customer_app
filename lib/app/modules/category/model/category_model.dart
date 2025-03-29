import 'dart:convert';

class Categories {
  List<GiftType> giftType = [];
  List<GiftType> occasion = [];
  List<International> international = [];

  Categories({
    required this.giftType,
    required this.occasion,
    required this.international,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    if (json['giftType'] != null) {
      giftType =
      List<GiftType>.from(json['giftType'].map((x) => GiftType.fromJson(x)));
    }
    if (json['Occasion'] != null) {
      occasion =
      List<GiftType>.from(json['Occasion'].map((x) => GiftType.fromJson(x)));
    }
    if (json['International'] != null) {
      international = List<International>.from(
          json['International'].map((x) => International.fromJson(x)));
    }
  }

  List<String> get mainCategory {
    List<String> categories = [];

    categories.addAll(giftType.map((e) => jsonEncode(e.toJson())));
    categories.addAll(occasion.map((e) => jsonEncode(e.toJson())));
    categories.addAll(international.map((e) => jsonEncode(e.toJson())));

    return categories;
  }

  static Categories fromMainCategory(List<String> mainCategory) {
    List<GiftType> giftTypes = [];
    List<GiftType> occasions = [];
    List<International> internationals = [];

    for (var category in mainCategory) {
      Map<String, dynamic> json = jsonDecode(category);
      if (json['type'] == 'category') {
        if (json.containsKey('type_id') &&
            json['type_id'].startsWith('gifts')) {
          giftTypes.add(GiftType.fromJson(json));
        } else if (json.containsKey('type_id') &&
            json['type_id'].startsWith('occasion')) {
          occasions.add(GiftType.fromJson(json));
        } else if (json.containsKey('type_id') &&
            json['type_id'].startsWith('international')) {
          internationals.add(International.fromJson(json));
        }
      }
    }

    return Categories(
      giftType: giftTypes,
      occasion: occasions,
      international: internationals,
    );
  }
}

class GiftType {
  String? categoryName;
  String? typeId;
  String? type;
  String? image;
  List<SubCategories>? subCategories;

  GiftType({
    this.categoryName,
    this.typeId,
    this.type,
    this.image,
    this.subCategories,
  });

  GiftType.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    typeId = json['type_id'];
    type = json['type'];
    image = json['image'];
    if (json['sub_categories'] != null) {
      subCategories = <SubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories!.add(SubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_name'] = categoryName;
    data['type_id'] = typeId;
    data['type'] = type;
    data['image'] = image;
    if (subCategories != null) {
      data['sub_categories'] =
          subCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  String? categoryName;
  String? typeId;
  String? type;
  List<SubCategoriesChilds>? subCategoriesChilds;

  SubCategories(
      {this.categoryName, this.typeId, this.type, this.subCategoriesChilds});

  SubCategories.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    typeId = json['type_id'];
    type = json['type'];
    if (json['sub_categories_childs'] != null) {
      subCategoriesChilds = <SubCategoriesChilds>[];
      json['sub_categories_childs'].forEach((v) {
        subCategoriesChilds!.add(SubCategoriesChilds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_name'] = categoryName;
    data['type_id'] = typeId;
    data['type'] = type;
    if (subCategoriesChilds != null) {
      data['sub_categories_childs'] =
          subCategoriesChilds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategoriesChilds {
  String? categoryName;
  String? typeId;
  String? type;

  SubCategoriesChilds({this.categoryName, this.typeId, this.type});

  SubCategoriesChilds.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    typeId = json['type_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_name'] = categoryName;
    data['type_id'] = typeId;
    data['type'] = type;
    return data;
  }
}

class International {
  String? categoryName;
  String? typeId;
  String? type;
  String? image;

  International({this.categoryName, this.typeId, this.type, this.image});

  International.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    typeId = json['type_id'];
    type = json['type'];
    image = json['image'];
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