import 'package:amity_sdk/core/enum/amity_query_sorting_order.dart';

enum AmityCommentSortOption { FIRST_CREATED, LAST_CREATED }

extension AmityCommentSortOptionExtension on AmityCommentSortOption {
  String get apiKey {
    return [
      'firstCreated',
      'lastCreated',
    ][index];
  }

  String get sortingColumn {
    return [
      'comment.createdAt',
      'comment.createdAt',
    ][index];
  }

  String get sortingOrder {
    return [
      AmityQuerySortingOrder.ASC.sqlOrder,
      AmityQuerySortingOrder.DESC.sqlOrder,
    ][index];
  }
}
