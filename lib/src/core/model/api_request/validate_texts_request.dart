class ValidateTextsRequest{

  final List<String> data;

  ValidateTextsRequest(this.data);

  factory ValidateTextsRequest.fromJson(Map<String, dynamic> json) {
    return ValidateTextsRequest(
      json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    return data;
  }
  

}