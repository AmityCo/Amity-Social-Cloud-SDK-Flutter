import 'package:amity_sdk/src/core/model/api_request/validate_texts_request.dart';
import 'package:amity_sdk/src/core/model/api_request/validate_urls_request.dart';
import 'package:amity_sdk/src/data/data_source/remote/api_interface/network_settings_api_interface.dart';
import 'package:amity_sdk/src/domain/repo/network_settings_repo.dart';

class NetworkSettingsRepoImpl extends NetworkSettingsRepo {

  final NetworkSettingsApiInterface networkSettingsApiInterface;


  NetworkSettingsRepoImpl({required this.networkSettingsApiInterface});

  @override
  Future<bool> validateTexts(ValidateTextsRequest request) async {
    return networkSettingsApiInterface.validateTexts(request);
  }

  @override
  Future<bool> validateUrls(ValidateUrlsRequest request) async {
    return networkSettingsApiInterface.validateUrls(request);
  }
}