
/// [AmityAdPlacement]
enum AmityAdPlacement { FEED, STORY, COMMENT, CHAT, CHATLIST }

/// [AmityAdPlacement] Extension
extension AmityAdPlacementExtension on AmityAdPlacement {
  /// Value
  String get value {
    return AmityAdPlacement.values[index].name.toLowerCase();
  }

  /// Enum Of
  static AmityAdPlacement enumOf(String value) {
    return AmityAdPlacement.values.firstWhere(
      (element) => element.name.toLowerCase() == value.toLowerCase(),
      orElse: () => AmityAdPlacement.FEED,
    );
  }
}
