enum AmityNonce { UNKNOWN, CHANNEL_LIST, COMMUNITY_LIST, PINNED_POST_LIST, POST_LIST, GLOBAL_FEED, CUSTOM_RANKING_FEED }

extension AmityNonceExtension on AmityNonce {
  int get value {
    final nonce = AmityNonce.values[index];
    switch (nonce) {
      case AmityNonce.CHANNEL_LIST: return 1;
      case AmityNonce.COMMUNITY_LIST: return 2;
      case AmityNonce.PINNED_POST_LIST: return 3;
      case AmityNonce.POST_LIST: return 4;
      case AmityNonce.GLOBAL_FEED: return 5;
      case AmityNonce.CUSTOM_RANKING_FEED: return 6;
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