class RewardModel {
  String? orderId;
  String? points;
  String? description;
  String? dateAdded;

  RewardModel({
    this.orderId,
    this.points,
    this.description,
    this.dateAdded,
  });

  RewardModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    points = json['points'];
    description = json['description'];
    dateAdded = json['date_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['points'] = points;
    data['description'] = description;
    data['date_added'] = dateAdded;
    return data;
  }
}
