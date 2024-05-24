import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_notification_settings_request.dart';
import 'package:amity_sdk/src/core/model/api_request/save_notification_settings_request.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/data_source/remote/api_interface/community_notification_api_interface.dart';
import 'package:amity_sdk/src/data/response/get_notification_settings_response.dart';
import 'package:dio/dio.dart';

class CommunityNotificationApiInterfaceImpl
    extends CommunityNotificationApiInterface {
  final HttpApiClient httpApiClient;

  CommunityNotificationApiInterfaceImpl({required this.httpApiClient});

  @override
  Future<GetNotificationSettingsResponse> getSetting(
      GetNotificationSettingsRequest request) async {
    try {
      final data = await httpApiClient()
          .get(NOTIFICATION_SETTINGS, queryParameters: request.toJson());
      return GetNotificationSettingsResponse.fromJson(data.data);
    } on DioException catch (error) {
      final amityError = AmityErrorResponse.fromJson(error.response!.data);
      return Future.error(amityError.amityException());
    }
  }

  @override
  Future<void> saveSettings(CommunityNotificationSettings request) async {
    try {
      final data = await httpApiClient()
          .post(NOTIFICATION_SETTINGS, data: request.toJson());
      return ;
    } on DioException catch (error) {
      final amityError = AmityErrorResponse.fromJson(error.response!.data);
      return Future.error(amityError.amityException());
    }
  }
}
