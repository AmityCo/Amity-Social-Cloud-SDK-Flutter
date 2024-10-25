import 'dart:async';

import 'package:amity_sdk/src/core/mapper/sub_channel_model_mapper.dart';
import 'package:amity_sdk/src/core/model/api_request/get_sub_channels_request.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/create_sub_channel_request.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/delete_sub_channel_request.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/update_sub_channel_request.dart';
import 'package:amity_sdk/src/core/utils/live_collection.dart';
import 'package:amity_sdk/src/core/utils/model_mapper.dart';
import 'package:amity_sdk/src/core/utils/page_list_data.dart';
import 'package:amity_sdk/src/data/converter/sub_channel/create_sub_channel_response_extension.dart';
import 'package:amity_sdk/src/data/converter/sub_channel/sub_channel_hive_extension_converter.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_db_adapter_impl/sub_channel_db_adapter_impl.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/sub_channel_hive_entity_35.dart';
import 'package:amity_sdk/src/domain/model/sub_channel/amity_sub_channel.dart';
import 'package:amity_sdk/src/domain/repo/sub_channel_repo.dart';

class SubChannelRepoImpl extends SubChannelRepo {
  final DbAdapterRepo dbAdapterRepo;
  final SubChannelApiInterface subChannelApiInterface;

  SubChannelRepoImpl({required this.dbAdapterRepo, required this.subChannelApiInterface});

  @override
  Future<AmitySubChannel> createSubChannel(CreateSubChannelRequest request) async {
    var data = await subChannelApiInterface.createSubChannel(request);
    final amitSubChannels = await data.saveToDb<AmitySubChannel>(dbAdapterRepo);
    return amitSubChannels[0];
  }

  @override
  Future<PageListData<List<AmitySubChannel>, String>> querySubChannels(GetSubChannelsRequest request) async {
    if(request.options?.token == null){
      await dbAdapterRepo.subChannelDbAdapter.deleteAll();
    }
    
    final data = await subChannelApiInterface.querySubChannels(request);
    final amitySubChannels = await data.saveToDb<AmitySubChannel>(dbAdapterRepo);
    return PageListData(amitySubChannels, data.paging!.next ?? '');
  }

  @override
  Future<AmitySubChannel> getSubChannel(String subChannelId) async {
    var data = await subChannelApiInterface.getSubChannel(subChannelId);
    final amitSubChannels = await data.saveToDb<AmitySubChannel>(dbAdapterRepo);
    return amitSubChannels[0];
  }

  @override
  Future<bool> deleteSubChannelById(DeleteSubChannelRequest request) async {
    var data = await subChannelApiInterface.deleteSubChannel(request);
    var deletedSubChannel = dbAdapterRepo.subChannelDbAdapter.getSubChannelEntity(request.subChannelId);
    if (request.permanent) {
      deletedSubChannel!.delete();
      return data;
    }
    deletedSubChannel!.isDeleted = true;
    deletedSubChannel.save();
    return data;
  }

  @override
  Future<AmitySubChannel> updateSubChannel(UpdateSubChannelRequest request) async {
    var data = await subChannelApiInterface.updateSubChannel(request);
    final amitSubChannels = await data.saveToDb<AmitySubChannel>(dbAdapterRepo);
    return amitSubChannels[0];
  }

  @override
  bool hasLocalSubChannel(String subChannelId) {
    return dbAdapterRepo.subChannelDbAdapter.getSubChannelEntity(subChannelId) != null;
  }

  @override
  Stream<List<AmitySubChannel>> listenPosts(RequestBuilder<GetSubChannelsRequest> request) {
    return dbAdapterRepo.subChannelDbAdapter.listenSubChannelEntities(request).map((event) {
      final List<AmitySubChannel> list = [];
      for (var element in event) {
        list.add(element.convertToSubChannel());
      }
      list.sort((a, b) => a.updatedAt.compareTo(b.updatedAt) * -1);
      return list;
    });
  }

  @override
  Future<AmitySubChannel?> fetchAndSave(String objectId) async {
    var subChannel = await getSubChannel(objectId);
    if (subChannel != null) {
      return subChannel;
    } else {
      await deleteSubChannelById(DeleteSubChannelRequest(subChannelId: objectId, permanent: true));
      return Future.value(null);
    }
  }

  @override
  ModelMapper<SubChannelHiveEntity, AmitySubChannel> mapper() {
    return SubChannelModelMapper();
  }

  @override
  StreamController<SubChannelHiveEntity> observeFromCache(String objectId) {
    final streamController = StreamController<SubChannelHiveEntity>();
    dbAdapterRepo.subChannelDbAdapter.listenSubChannelEntity(objectId).listen((event) {
      streamController.add(event);
    });
    return streamController;
  }

  @override
  Future<SubChannelHiveEntity?> queryFromCache(String objectId) {
    return Future.value(dbAdapterRepo.subChannelDbAdapter.getSubChannelEntity(objectId));
  }
}
