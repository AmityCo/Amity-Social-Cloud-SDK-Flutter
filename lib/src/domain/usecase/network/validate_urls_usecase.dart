import 'package:amity_sdk/src/core/model/api_request/validate_urls_request.dart';
import 'package:amity_sdk/src/domain/repo/network_settings_repo.dart';
import 'package:amity_sdk/src/src.dart';

class ValidateUrlsUseCase extends UseCase<bool , List<String>>{
  NetworkSettingsRepo networkSettingsRepo;

  ValidateUrlsUseCase({required this.networkSettingsRepo});
  
  @override
  Future<bool> get(List<String> params) {
    return networkSettingsRepo.validateUrls(ValidateUrlsRequest(data: params));
  }



  

}