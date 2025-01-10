import 'package:amity_sdk/src/core/utils/amity_hive_type.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:hive/hive.dart';

part 'analytics_event_hive_entity_24.g.dart';

@HiveType(typeId: AmityHiveType.analyticsEvent)
class AnalyticsEventHiveEntity extends EkoObject {
  String? eventId;

  String? userId;

  String? contentId;

  String? contentType;

  String? activityType;

  String? syncPriority;

  Map<String, dynamic>? metadata;

  @override
  String? getId() {
    return eventId;
  }
}
