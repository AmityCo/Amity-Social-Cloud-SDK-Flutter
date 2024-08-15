enum AmityNonce { UNKNOWN, CHANNEL_LIST, COMMUNITY_LIST }

extension AmityNonceExtension on AmityNonce {
  int get value {
    final nonce = AmityNonce.values[index];
    switch (nonce) {
      case AmityNonce.CHANNEL_LIST: return 1;
      case AmityNonce.COMMUNITY_LIST: return 2;
      default: return 0;
    }
  }

  static AmityNonce enumOf(int value) {
    return AmityNonce.values.firstWhere(
      (element) => element.value == value,
      orElse: () => AmityNonce.UNKNOWN,
    );
  }
}