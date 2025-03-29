class AddressType{
  String name;
  bool isSelected;

  AddressType({required this.name,this.isSelected = false});
}

class AddressModel{
  int id;
  String fullName;
  String mobile;
  String alterNateMobile;
  String pinCode;
  String city;
  String state;
  String address1;
  String? address2;
  String addressType;
  bool isDefault;
  bool isSelected;

  AddressModel({
    required this.id,
    required this.fullName,
    required this.mobile,
    required this.alterNateMobile,
    required this.pinCode,
    required this.city,
    required this.state,
    required this.address1,
    this.address2,
    required this.addressType,
    this.isDefault = false,
    this.isSelected = false,
  });
}

class Address {
  String? addressId;
  String? firstname;
  String? city;
  String? cityId;
  String? postcode;
  String? address1;
  String? telephone;
  String? alternateTelephone;
  String? addressType;
  String? salutation;
  String isDefault = "";
  bool isSelected = false;

  Address({
    this.addressId,
    this.firstname,
    this.city,
    this.cityId,
    this.postcode,
    this.address1,
    this.telephone,
    this.alternateTelephone,
    this.addressType,
    this.salutation,
    this.isDefault = "",
    this.isSelected = false,
  });

  Address.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    firstname = json['firstname'];
    city = json['city'];
    cityId = json['city_id'];
    postcode = json['postcode'];
    address1 = json['address_1'];
    telephone = json['telephone'];
    alternateTelephone = json['alternate_telephone'];
    addressType = json['address_type'];
    salutation = json['salutation'];
    isDefault = json['default_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressId;
    data['firstname'] = firstname;
    data['city'] = city;
    data['city_id'] = cityId;
    data['postcode'] = postcode;
    data['address_1'] = address1;
    data['telephone'] = telephone;
    data['alternate_telephone'] = alternateTelephone;
    data['address_type'] = addressType;
    data['salutation'] = salutation;
    data['default_address'] = isDefault;
    return data;
  }
}