
class NotifiableEventsRequest {
  String? name;
  String? moduleName;
  bool? isPushNotifiable;
  List<String>? listenFromRoleIds;
  List<String>? ignoreFromRoleIds;

  NotifiableEventsRequest(
      {this.name,
      this.moduleName,
      this.isPushNotifiable,
      this.listenFromRoleIds,
      this.ignoreFromRoleIds});

  Map<String, dynamic> toJson() => {
        "name": name,
        "isPushNotifiable": isPushNotifiable,
        "listenFromRoleIds": listenFromRoleIds?? [],
        "ignoreFromRoleIds": ignoreFromRoleIds?? []
      };

  factory NotifiableEventsRequest.fromJson(Map<String, dynamic> json) =>
      NotifiableEventsRequest(
          name: json["name"],
          moduleName: json["moduleName"],
          isPushNotifiable: json["isPushNotifiable"],
          listenFromRoleIds: json["listenFromRoleIds"],
          ignoreFromRoleIds: json["ignoreFromRoleIds"]);
}