import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/utils/amity_nonce.dart';

class GetCustomRankFeedRequest extends PaginatedApiRequest {
  List<String>? dataTypes;
  GetCustomRankFeedRequest({String? token, this.dataTypes, int limit = 10})
      : super(token, limit);

  Map<String, dynamic> toJson() => {
        'token': token,
        'limit': limit,
        'dataTypes[]': dataTypes == null
            ? null
            : List<String>.from(dataTypes!.map((x) => x)),
      }..removeNullValue();

  @override
  int get hashCode => 'GLOBAL_FEED_${dataTypes?.join('_')}'.hashCode;

  int getHashCode() {
    return hashCode;
  }

  AmityNonce getNonce() {
    return AmityNonce.CUSTOM_RANKING_FEED;
  }
}
