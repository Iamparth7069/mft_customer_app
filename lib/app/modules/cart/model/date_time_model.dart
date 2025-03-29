class DateTimeModel{
  String name;
  String price;
  String image;
  List<TimeModel> subTime;
  bool isSelected = false;

  DateTimeModel({required this.name,required this.subTime,required this.price,required this.image,this.isSelected = false});
}

class TimeModel{
  String name;
  bool isSelected = false;

  TimeModel({required this.name,this.isSelected = false});
}

class OccasionModel{
  String name;
  bool isSelected = false;

  OccasionModel({required this.name,this.isSelected = false});
}