import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_sub_channels_request.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/create_sub_channel_request.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/delete_sub_channel_request.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/update_sub_channel_request.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:amity_sdk/src/data/response/response.dart';
import 'package:dio/dio.dart';

class SubChannelApiInterfaceImpl extends SubChannelApiInterface {
  final HttpApiClient httpApiClient;

  SubChannelApiInterfaceImpl({required this.httpApiClient});

  @override
  Future<CreateSubChannelResponse> createSubChannel(CreateSubChannelRequest request) async {
    try {
      final data = await httpApiClient().post(
        MESSAGE_FEED_V5,
        data: request.toJson(),
      );
      return CreateSubChannelResponse.fromJson(data.data);
    } on DioException catch (error) {
      final amityError = AmityErrorResponse.fromJson(error.response!.data);
      return Future.error(amityError.amityException());
    }
  }

  @override
  Future<CreateSubChannelResponse> querySubChannels(GetSubChannelsRequest request) async {
    try {
      final data = await httpApiClient().get(
        "$MESSAGE_FEED_V5/channel/${request.channelId}",
        queryParameters: request.toJson(),
      );
      return CreateSubChannelResponse.fromJson(data.data);
    } on DioException catch (error) {
      final amityError = AmityErrorResponse.fromJson(error.response!.data);
      return Future.error(amityError.amityException());
    }
  }

  @override
  Future<CreateSubChannelResponse> getSubChannel(String subChannelId) async {
    try {
      final data = await httpApiClient().get(
        "$MESSAGE_FEED_V5/$subChannelId",
      );
      return CreateSubChannelResponse.fromJson(data.data);
    } on DioException catch (error) {
      final amityError = AmityErrorResponse.fromJson(error.response!.data);
      return Future.error(amityError.amityException());
    }
  }

  @override
  Future<bool> deleteSubChannel(DeleteSubChannelRequest request) async {
    try {
      await httpApiClient().delete(
        "$MESSAGE_FEED_V5/${request.subChannelId}",
        queryParameters: {
          "permanent": request.permanent,
        },
      );
      return true;
    } on DioException catch (error) {
      final amityError = AmityErrorResponse.fromJson(error.response!.data);
      return Future.error(amityError.amityException());
    }
  }

  @override
  Future<CreateSubChannelResponse> updateSubChannel(UpdateSubChannelRequest request) async {
    try {
      final data = await httpApiClient().put(
        "$MESSAGE_FEED_V5/${request.subChannelId}",
        data: request.toJson(),
      );
      return CreateSubChannelResponse.fromJson(data.data);
    } on DioException catch (error) {
      final amityError = AmityErrorResponse.fromJson(error.response!.data);
      return Future.error(amityError.amityException());
    }
  }
}
