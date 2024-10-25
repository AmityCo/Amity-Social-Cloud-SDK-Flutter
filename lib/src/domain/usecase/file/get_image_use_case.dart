import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class GetImageUseCase extends UseCase<AmityImage, String> {
  final FileRepo fileRepo;

  GetImageUseCase({required this.fileRepo});

  @override
  Future<AmityImage> get(String fileId) async {
    var fileProperties = await fileRepo.getFileByIdFromDb(fileId);
    return AmityImage(fileProperties);
  }
}
