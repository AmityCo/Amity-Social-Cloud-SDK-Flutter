// ignore_for_file: constant_identifier_names
/// [AmityMessageSyncState]
enum AmityMessageSyncState { SYNCED, FAILED, CREATED, UPLOADING, SYNCING }

/// [AmityMessageSyncState] Extension
extension AmityMessageSyncStateExtension on AmityMessageSyncState {
  String get value {
    return AmityMessageSyncState.values[index].name.toLowerCase();
  }

  int compareTo(AmityMessageSyncState other) {
    return index.compareTo(other.index);
  }

  //TODO - this method need to acceesable with AmityDataType
  static AmityMessageSyncState enumOf(String value) {
    return AmityMessageSyncState.values.firstWhere(
      (element) => element.name.toLowerCase() == value.toLowerCase(),
      orElse: () => AmityMessageSyncState.SYNCED,
    );
  }
}

extension AmityStringToMessageSyncStateExtension on String {
  AmityMessageSyncState get toAmityMessageSyncState {
    return AmityMessageSyncStateExtension.enumOf(this);
  }
}
