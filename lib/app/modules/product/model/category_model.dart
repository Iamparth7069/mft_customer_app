class Category {
  String categoryName;
  String typeId;
  String type;
  String image;

  Category({
    required this.categoryName,
    required this.typeId,
    required this.type,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryName: json['name'],
      typeId: json['type_id'],
      type: json['type'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = categoryName;
    data['type_id'] = typeId;
    data['type'] = type;
    data['image'] = image;
    return data;
  }
}