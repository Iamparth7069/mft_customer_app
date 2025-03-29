class SortModel{
  String name;
  String subName;
  bool isSelected = false;

  SortModel({required this.name,required this.subName,this.isSelected = false});
}

class FilterModel{
  String name;
  List<SubFilter> subFilter;
  bool isSelected = false;

  FilterModel({required this.name,required this.subFilter,this.isSelected = false});
}

class SubFilter{
  String name;
  String value;
  bool isSelected = false;

  SubFilter({required this.name,required this.value,this.isSelected = false});
}

