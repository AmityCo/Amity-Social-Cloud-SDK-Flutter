import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/model/api_request/get_sub_channels_request.dart';
import 'package:amity_sdk/src/core/service_locator/sdk_service_locator.dart';
import 'package:amity_sdk/src/data/converter/message/message.dart';
import 'package:amity_sdk/src/data/converter/sub_channel/sub_channel_hive_extension_converter.dart';
import 'package:amity_sdk/src/data/converter/sub_channel/sub_channel_response_extension_converter.dart';
import 'package:amity_sdk/src/data/converter/user_response_extension_converter.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/sub_channel_hive_entity_35.dart';
import 'package:amity_sdk/src/data/response/response.dart';

extension CreateSubChannelResponseExtension on CreateSubChannelResponse {

  Future saveToDb<T>(DbAdapterRepo dbRepo) async {

    List<SubChannelHiveEntity> subChannelHiveEntities =
        subChannels.map((e) => e.convertToSubChannelHiveEntity()).toList();

    List<UserHiveEntity> userHiveEntity =
        users.map((e) => e.convertToUserHiveEntity()).toList();


    List<MessageHiveEntity> messageHiveEntity =
        messages.map((e) => e.convertToMesageHiveEntity()).toList();


    for (var e in subChannelHiveEntities) {
      await dbRepo.subChannelDbAdapter.saveSubChannelEntity(e);
    }

    for (var e in userHiveEntity) {
      await dbRepo.userDbAdapter.saveUserEntity(e);
    }

    for (var e in messageHiveEntity) {
      e.syncState = AmityMessageSyncState.SYNCED.value;
      await dbRepo.messageDbAdapter.saveMessageEntity(e);
    }

    if (T.toString() == 'AmitySubChannel') {
      return subChannelHiveEntities
          .map((e) => e.convertToSubChannel())
          .toList();
    }
  }



}