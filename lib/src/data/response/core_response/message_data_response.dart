/// Poll Data Response
class MessageDataResponse {
  /// Init Post Data Response
  MessageDataResponse({
    required this.text,
    required this.fileId,
    required this.caption,
    this.thumbnailFileId,
  });

  /// Text
  String? text;

  /// File Id
  String? fileId;

  /// Caption
  String? caption;

  /// Thumbnail File Id
  String? thumbnailFileId;

  /// Factory method to init from json
  factory MessageDataResponse.fromJson(Map<String, dynamic>? json) =>
      MessageDataResponse(
        text: json?["text"],
        fileId: json?["fileId"],
        caption: json?["caption"],
        thumbnailFileId: json?["thumbnailFileId"],
      );

  /// convert to map
  Map<String, dynamic> toJson() => {
        "text": text,
        "fileId": fileId,
        "caption": caption,
        "thumbnailFileId": thumbnailFileId,
      };
}
