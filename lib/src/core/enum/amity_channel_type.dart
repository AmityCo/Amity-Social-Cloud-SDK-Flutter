/// Amity Channel Type
// ignore_for_file: constant_identifier_names, public_member_api_docs

enum AmityChannelType {
  COMMUNITY,
  LIVE,
  BROADCAST,
  CONVERSATION,
}

/// Amity Channel Type Extension
extension AmityChannelTypeExtension on AmityChannelType {
  String get value {
    return AmityChannelType.values[index].name.toLowerCase();
  }

  //TODO - this method need to acceesable with AmityChannelType
  static AmityChannelType enumOf(String? value) {
    final type = value ?? "";
    return AmityChannelType.values.firstWhere(
      (element) => element.name.toLowerCase() == type.toLowerCase(),
      orElse: () => AmityChannelType.COMMUNITY,
    );
  }
}
