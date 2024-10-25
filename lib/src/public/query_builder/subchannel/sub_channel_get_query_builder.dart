import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_sub_channels_request.dart';
import 'package:amity_sdk/src/domain/usecase/subchannel/sub_channel_get_usecase.dart';

class AmitySubChannelQuery{

   final SubChannelGetUsecase _useCase;

    AmitySubChannelQuery({required SubChannelGetUsecase useCase}) : _useCase = useCase;

   String? _channelId;
   bool? _excludeMainSubChannel = true;
   bool? _isDeleted = false; 

  AmitySubChannelQuery includeDeleted(bool includeDeleted) {
    _isDeleted = includeDeleted;
    return this;
  }

  AmitySubChannelQuery excludeMainSubChannel(bool excludeMainSubChannel) {
    _excludeMainSubChannel = excludeMainSubChannel;
    return this;
  }

  AmitySubChannelQuery channelId(String channelId) {
    _channelId = channelId;
    return this;
  }


  Future<PageListData<List<AmitySubChannel>, String>> getPagingData({String? token, int? limit}) async {
    GetSubChannelsRequest request = GetSubChannelsRequest();
    request.channelId = _channelId;
    request.excludeMainSubChannel = _excludeMainSubChannel;
    request.isDeleted = _isDeleted;

    request.options = OptionsRequest();

    if (token != null) {
      request.options!.token = token;
    }
    if (limit != null) {
      request.options!.limit = limit;
    }

    final data = await _useCase.get(request);

    return data;
  }

  GetSubChannelsRequest build({int? pageSize = 20}){
    GetSubChannelsRequest request = GetSubChannelsRequest();
    request.channelId = _channelId;
    request.excludeMainSubChannel = _excludeMainSubChannel;
    request.isDeleted = _isDeleted;
    request.options = OptionsRequest();
    return request;
  }


}