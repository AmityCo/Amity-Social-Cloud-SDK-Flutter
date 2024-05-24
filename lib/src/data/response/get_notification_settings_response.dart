import 'package:amity_sdk/src/core/core.dart';

class GetNotificationSettingsResponse{
  bool?  isPushNotifiable;
  bool? isUserEnabled;
  List<NotifiableEvents>? notifiableEvents;

  GetNotificationSettingsResponse({this.isPushNotifiable, this.isUserEnabled, this.notifiableEvents});

  factory GetNotificationSettingsResponse.fromJson(Map<String, dynamic> json) => GetNotificationSettingsResponse(
    isPushNotifiable: json["isPushNotifiable"],
    isUserEnabled: json["isUserEnabled"],
    notifiableEvents: json["notifiableEvents"] == null ? null : List<NotifiableEvents>.from(json["notifiableEvents"].map((x) => NotifiableEvents.fromJson(x))),
  );

  
  Map<String, dynamic> toJson() => {
    "isPushNotifiable": isPushNotifiable,
    "isUserEnabled": isUserEnabled,
    "notifiableEvents": notifiableEvents == null ? null : List<dynamic>.from(notifiableEvents!.map((x) => x.toJson())),
  }..removeNullValue();

}




class NotifiableEvents{
  String? name;
  String? moduleName;
  String? eventName;
  bool? isPushNotifiable;
  bool? isNetworkEnabled;
  List<String>? listenFromRoleIds;
  List<String>? ignoreFromRoleIds;

  NotifiableEvents(
      {this.name,
      this.moduleName,
      this.eventName,
      this.isNetworkEnabled,
      this.isPushNotifiable,
      this.listenFromRoleIds,
      this.ignoreFromRoleIds});

  Map<String, dynamic> toJson() => {
        "name": name,
        "moduleName": moduleName,
        "isPushNotifiable": isPushNotifiable,
        "listenFromRoleIds": listenFromRoleIds,
        "ignoreFromRoleIds": ignoreFromRoleIds,
        "eventName": eventName,
        "isNetworkEnabled": isNetworkEnabled,
      }..removeNullValue();

  factory NotifiableEvents.fromJson(Map<String, dynamic> json) =>
      NotifiableEvents(
          name: json["name"],
          moduleName: json["moduleName"],
          isPushNotifiable: json["isPushNotifiable"],
          listenFromRoleIds:List<String>.from(json["listenFromRoleIds"].map((x) => x)),
          ignoreFromRoleIds:  List<String>.from(json["ignoreFromRoleIds"].map((x) => x)),
          eventName: json["eventName"],
          isNetworkEnabled: json["isNetworkEnabled"]);
}
