class QueryGlobalPinnedPostRequest {
  QueryGlobalPinnedPostRequest();

  factory QueryGlobalPinnedPostRequest.fromJson(Map<String, dynamic> json) =>
      QueryGlobalPinnedPostRequest();

  Map<String, dynamic> toJson() {
    return {"isDeleted": false}..removeWhere((key, value) => value == null);
  }

  int getHashCode() {
    final jsonString = (toJson()..remove('options')).toString();
    return jsonString.hashCode;
  }
}
