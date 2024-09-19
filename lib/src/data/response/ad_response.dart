class AdResponse {
  final String? adId;
  final String? advertiserId;
  final String? name;
  final List<String>? placements;
  final String? headline;
  final String? description;
  final String? body;
  final String? image1_1;
  final String? image9_16;
  final String? callToAction;
  final String? callToActionUrl;
  final Map<String, dynamic>? target;
  final DateTime? startAt;
  final DateTime? endAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AdResponse(
      {required this.adId,
      required this.advertiserId,
      required this.name,
      required this.placements,
      required this.headline,
      required this.description,
      required this.body,
      this.image1_1,
      this.image9_16,
      required this.callToAction,
      required this.callToActionUrl,
      required this.target,
      this.startAt,
      this.endAt,
      this.createdAt,
      this.updatedAt});

  factory AdResponse.fromJson(Map<String, dynamic> json) => AdResponse(
        adId: json['adId'],
        advertiserId: json['advertiserId'],
        name: json['name'],
        placements: List<String>.from(json['placements']),
        headline: json['headline'],
        description: json['description'],
        body: json["hashFlag"],
        image1_1: json['image1_1'],
        image9_16: json['image9_16'],
        callToAction: json['callToAction'],
        callToActionUrl: json['callToActionUrl'],
        target: json['target'],
        startAt:
            json['startAt'] != null ? DateTime.parse(json['startAt']) : null,
        endAt: json['endAt'] != null ? DateTime.parse(json['endAt']) : null,
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'adId': adId,
        'advertiserId': advertiserId,
        'name': name,
        'placements': List<dynamic>.from(placements!.map((x) => x)),
        'headline': headline,
        'description': description,
        'body': body,
        'image1_1': image1_1,
        'image9_16': image9_16,
        'callToAction': callToAction,
        'callToActionUrl': callToActionUrl,
        'target': target,
        'startAt': startAt?.toIso8601String(),
        'endAt': endAt?.toIso8601String(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
