class TrendingSearch {
  List<TrendingSearchModel>? lists;

  TrendingSearch({this.lists});

  TrendingSearch.fromJson(Map<String, dynamic> json) {
    if (json['lists'] != null) {
      lists = <TrendingSearchModel>[];
      json['lists'].forEach((v) {
        lists!.add(TrendingSearchModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (lists != null) {
      data['lists'] = lists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrendingSearchModel {
  String? categoryName;
  String? typeId;
  String? type;

  TrendingSearchModel({this.categoryName, this.typeId, this.type});

  TrendingSearchModel.fromJson(Map<String, dynamic> json) {
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