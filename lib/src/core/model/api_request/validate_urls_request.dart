class ValidateUrlsRequest{
  List<String> data; 
  ValidateUrlsRequest({required this.data});

  factory ValidateUrlsRequest.fromJson(Map<String, dynamic> json) => ValidateUrlsRequest(
    data: List<String>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}