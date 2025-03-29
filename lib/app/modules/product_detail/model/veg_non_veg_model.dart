class VegNonVeg{
  String type;
  String image;
  String price;
  bool isSelected;

  VegNonVeg({required this.type,required this.image,required this.price,this.isSelected = false});
}

class SwitchList{
  String type;
  String id;
  bool isSelected;

  SwitchList({required this.id,required this.type,this.isSelected = false});
}

class Occasions{
  String type;
  String name;
  String image;

  Occasions({required this.type,required this.name,required this.image});
}