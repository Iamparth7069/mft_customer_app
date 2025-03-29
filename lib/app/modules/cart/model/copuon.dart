class CoponModel {
  CoponModel({
      this.result, 
      this.message, 
      this.status,});

  CoponModel.fromJson(dynamic json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }
  Result? result;
  String? message;
  bool? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.toJson();
    }
    map['message'] = message;
    map['status'] = status;
    return map;
  }

}

class Result {
  Result({
      this.totals, 
      this.coupon,});

  Result.fromJson(dynamic json) {
    if (json['totals'] != null) {
      totals = [];
      json['totals'].forEach((v) {
        totals?.add(Totals.fromJson(v));
      });
    }
    coupon = json['coupon'];
  }
  List<Totals>? totals;
  String? coupon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (totals != null) {
      map['totals'] = totals?.map((v) => v.toJson()).toList();
    }
    map['coupon'] = coupon;
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