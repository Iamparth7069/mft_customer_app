class OptionValue {
  String id;
  String text;
  String textPrice;
  String? image;
  bool isSelected = false;
  OptionValue({required this.id, required this.text, required this.textPrice,this.image,this.isSelected = false});

  factory OptionValue.fromJson(Map<String, dynamic> json) {
    return OptionValue(
      id: json['id'],
      text: json['text'] ?? "",
      image: json['image'] ?? "",
      textPrice: json['text_pr'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'image': image,
      'text_pr': textPrice,
    };
  }

  String getWeight() {
    return '${text.split(' ')[0]} ${text.split(' ')[1]}';
  }

  // Helper method to get the price
  String getPrice() {
    final regex = RegExp(r'\+ Rs\. (\d{1,3}(?:,\d{3})*)(?:\.\d+)?');
    final match = regex.firstMatch(textPrice);
    return match != null ? match.group(1) ?? '' : '';
  }



  String extractOptionText() {
    // Example: "Make it Eggless (+ Rs. 50)"
    // Extract "Eggless"
    if (text.contains('Make it ')) {
      final startIndex = text.indexOf('Make it ') + 'Make it '.length;
      final endIndex = text.indexOf(' (+ Rs.');
      return text.substring(startIndex, endIndex);
    }
    return text;
  }

  String extractOptionText1() {
    // Example: "Make it Eggless (+ Rs. 50)"
    // Extract "Make it Eggless"
    if (text.contains('Make it ')) {
      final startIndex = text.indexOf('Make it ');
      final endIndex = text.indexOf(' (+ Rs.');
      return text.substring(startIndex, endIndex);
    }
    return text;
  }
}

class OptionData {
  String name;
  String type;
  List<OptionValue> optionValues;
  bool isSelected;

  OptionData({
    required this.name,
    required this.type,
    required this.optionValues,
    this.isSelected = false, // Default value for isSelected
  });

  factory OptionData.fromJson(Map<String, dynamic> json) {
    return OptionData(
      name: json['name'],
      type: json['type'],
      optionValues: (json['option_values'] as List)
          .map((i) => OptionValue.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'option_values': optionValues.map((e) => e.toJson()).toList(),
      'is_selected': isSelected,
    };
  }
}