import 'package:amity_sdk/amity_sdk.dart';

class AmityUserNotificationSettings{
  bool? isEnabled;
  List<AmityUserNotificationModule>? events;
  
  AmityUserNotificationSettings({this.isEnabled, this.events});
}