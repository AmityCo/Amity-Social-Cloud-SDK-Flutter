enum AmityNonce { CHANNEL_LIST }

extension AmityNonceExtension on AmityNonce {
  int get value {
    final nounce = AmityNonce.values[index];
    switch (nounce) {
      case AmityNonce.CHANNEL_LIST: return 1;
      default: return 1;
    }
  }

  static AmityNonce enumOf(int value) {
    return AmityNonce.values.firstWhere(
      (element) => element.value == value,
      orElse: () => AmityNonce.CHANNEL_LIST,
    );
  }
}