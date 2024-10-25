class AmityAdFrequency {
  final String type;
  final int value;

  AmityAdFrequency({
    required this.type,
    required this.value,
  });

  factory AmityAdFrequency.fromJson(Map<String, dynamic> json) {
    return AmityAdFrequency(
      type: json['type'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'value': value,
    };
  }

  String getType() {
    return type;
  }

  int getValue() {
    return value;
  }
}
