import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/create_sub_channel_request.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/delete_sub_channel_request.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/update_sub_channel_request.dart';
import 'package:amity_sdk/src/domain/usecase/subchannel/sub_channel_create_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/subchannel/sub_channel_delete_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/subchannel/sub_channel_get_by_id_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/subchannel/sub_channel_get_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/subchannel/sub_channel_update_usecase.dart';
import 'package:amity_sdk/src/public/query_builder/subchannel/sub_channel_get_live_object.dart';
import 'package:amity_sdk/src/public/query_builder/subchannel/sub_channel_get_query_builder.dart';

class AmitySubChannelRepository {

  SubChannelGetLiveObject live = SubChannelGetLiveObject();

  Future<AmitySubChannel> createSubChannel(String channelId, String displayName) {
    return serviceLocator.get<SubChannelCreateUseCase>().get(
          CreateSubChannelRequest(
            channelId: channelId,
            name: displayName,
          ),
        );
  }

  AmitySubChannelQuery getSubChannels() {
    return AmitySubChannelQuery(useCase: serviceLocator.get<SubChannelGetUsecase>());
  }

  Future<AmitySubChannel> getSubChannel({required String subChannelId}) {
    return serviceLocator.get<SubChannelGetByIdUsecase>().get(
          subChannelId,
        );
  }

  Future<bool> softDeleteSubChannel({required String subChannelId}) {
    return serviceLocator.get<SubChannelDeleteUseCase>().get(DeleteSubChannelRequest(subChannelId: subChannelId, permanent: false));
  }

  Future<bool> hardDeleteSubChannel({required String subChannelId}) {
    return serviceLocator.get<SubChannelDeleteUseCase>().get(DeleteSubChannelRequest(subChannelId: subChannelId, permanent: true));
  }

  Future<AmitySubChannel> updateeditSubChannelSubChannel({required String subChannelId, required String displayName}) {
    return serviceLocator.get<SubChannelUpdateUseCase>().get(
          UpdateSubChannelRequest(
            subChannelId: subChannelId,
            name: displayName,
          ),
        );
  }
}
