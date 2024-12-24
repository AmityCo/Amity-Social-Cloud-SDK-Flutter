import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

/// [MessageFileComposerUsecase]
class MessageFileComposerUsecase
    extends UseCase<AmityMessageData, AmityMessageData> {
  /// File Repo
  final FileRepo fileRepo;

  /// Init [MessageFileComposerUsecase]
  MessageFileComposerUsecase({required this.fileRepo});
  @override
  Future<AmityMessageData> get(AmityMessageData params) async {
    if (params.fileId != null) {
      final fileProperties = await fileRepo.getFileByIdFromDb(params.fileId!);

      if (params is MessageImageData) {
        final image = AmityImage(fileProperties);
        params.image = image;
        params.fileInfo = image;
      }

      if (params is MessageVideoData) {
        try {
          params.fileInfo = AmityFile(fileProperties);
          final thumbnailFileId = params.rawData?["thumbnailFileId"] as String?;
          if (thumbnailFileId != null) {
            final thumbnailFileProperties =
                await fileRepo.getFileByIdFromDb(thumbnailFileId);
            final thumbnailImageFile = AmityImage(thumbnailFileProperties);
            params.thumbnailImageFile = thumbnailImageFile;
          }
        } catch (e) {
          // Fail to parse thumbnail
        }
      }

      // if (params is VideoData) {
      //   final thumbnailFile = AmityImage(fileProperties);
      //   // params.thumbnail = thumbnailFile;

      //   // final videoFile = AmityVideo(_fileProperties);
      //   // params.fileInfo = videoFile;
      // }

      if (params is MessageFileData) {
        final file = AmityFile(fileProperties);
        params.file = file;
        params.fileInfo = file;
      }
    }
    return params;
  }
}
