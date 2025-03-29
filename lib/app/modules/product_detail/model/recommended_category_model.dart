class RecommendedCategory {
  String categoryName;
  String typeId;
  String type;
  String image;

  RecommendedCategory({
    required this.categoryName,
    required this.typeId,
    required this.type,
    required this.image,
  });

  factory RecommendedCategory.fromJson(Map<String, dynamic> json) {
    return RecommendedCategory(
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