class AdvertiserResponse {
  final String advertiserId;
  final String name;
  final String companyName;
  final String? avatarFileId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AdvertiserResponse(
      {required this.advertiserId,
      required this.name,
      required this.companyName,
      this.avatarFileId,
      this.createdAt,
      this.updatedAt});

  factory AdvertiserResponse.fromJson(Map<String, dynamic> json) =>
      AdvertiserResponse(
        advertiserId: json['advertiserId'],
        name: json['name'],
        companyName: json['companyName'],
        avatarFileId: json['avatarFileId'],
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'advertiserId': advertiserId,
        'name': name,
        'companyName': companyName,
        'avatarFileId': avatarFileId,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
