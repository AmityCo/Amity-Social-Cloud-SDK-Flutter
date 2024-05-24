class TextUrlValidationResponse {
  final bool success;

  TextUrlValidationResponse({required this.success});

  factory TextUrlValidationResponse.fromJson(Map<String, dynamic> json) {
    return TextUrlValidationResponse(
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    return data;
  }
}