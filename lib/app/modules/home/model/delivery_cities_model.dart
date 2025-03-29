class TopCity {
  int cityId;
  String name;
  String image;

  TopCity({
    required this.cityId,
    required this.name,
    required this.image,
  });

  factory TopCity.fromJson(Map<String, dynamic> json) {
    return TopCity(
      cityId: json['city_id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

class DeliveryCity {
  String cityId;
  String name;

  DeliveryCity({
    required this.cityId,
    required this.name,
  });

  factory DeliveryCity.fromJson(Map<String, dynamic> json) {
    return DeliveryCity(
      cityId: json['city_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['name'] = name;
    return data;
  }
}