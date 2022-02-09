import 'package:amity_sdk/core/constant/global_constant.dart';
import 'package:amity_sdk/core/model/api_request/authentication_request.dart';
import 'package:amity_sdk/data/data.dart';
import 'package:amity_sdk/data/data_source/remote/api_interface/authentication_api_interface.dart';
import 'package:amity_sdk/data/response/session_response.dart';
import 'package:amity_sdk/public/amity_core_client.dart';
import 'package:dio/dio.dart';

class AuthenticationApiInterfaceImpl extends AuthenticationApiInterface {
  AuthenticationApiInterfaceImpl(
      {required this.httpApiClient, required this.amityCoreClientOption});
  final HttpApiClient httpApiClient;
  final AmityCoreClientOption amityCoreClientOption;
  @override
  Future<SessionResponse> login(AuthenticationRequest request) async {
    final data = await httpApiClient.dio.post(SESSION_URL,
        data: request,
        options: Options(headers: {'X-API-Key': amityCoreClientOption.apiKey}));
    return SessionResponse.fromJson(data.data);
  }
}
