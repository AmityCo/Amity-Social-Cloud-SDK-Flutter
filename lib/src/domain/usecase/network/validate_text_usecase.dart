import 'package:amity_sdk/src/core/model/api_request/validate_texts_request.dart';
import 'package:amity_sdk/src/domain/repo/network_settings_repo.dart';
import 'package:amity_sdk/src/src.dart';

class ValidateTextsUseCase extends UseCase<bool , List<String>> {

  NetworkSettingsRepo networkSettingsRepo;

  ValidateTextsUseCase({required this.networkSettingsRepo});

  @override
  Future<bool> get(List<String> params) {
    return networkSettingsRepo.validateTexts(ValidateTextsRequest( params));
  }

}