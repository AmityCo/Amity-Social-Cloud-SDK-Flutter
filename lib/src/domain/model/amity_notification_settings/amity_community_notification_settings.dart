import 'package:amity_sdk/amity_sdk.dart';

class AmityCommunityNotificationSettings{
  bool? isEnabled;
  List<AmityCommunityNotificationEvent>? events;
  
  AmityCommunityNotificationSettings({this.isEnabled, this.events});
}