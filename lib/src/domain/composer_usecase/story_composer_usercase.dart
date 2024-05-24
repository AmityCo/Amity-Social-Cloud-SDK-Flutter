import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_targets_by_targets_request.dart';
import 'package:amity_sdk/src/domain/composer_usecase/story_target_composer_usecase.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/story_target_repo.dart';

class StoryComposerUseCase extends UseCase<AmityStory, AmityStory> {
  /// User Repo
  final UserRepo userRepo;

  /// User Composer UseCase
  final UserComposerUsecase userComposerUsecase;

  /// File Repo
  final FileRepo fileRepo;

  /// Story Target Repo
  final StoryTargetRepo storyTargetRepo;
  
  /// Story composer usecase
  final StoryTargetComposerUseCase storyTargetComposerUseCase;

  /// Post File Composer UseCase
  StoryComposerUseCase(
      {required this.userRepo,
      required this.userComposerUsecase,
      required this.fileRepo, 
      required this.storyTargetRepo,
      required this.storyTargetComposerUseCase});

  @override
  Future<AmityStory> get(AmityStory params) async {
    final user = await userRepo.getUserByIdFromDb(params.creatorPublicId!);
    final composedUser = await userComposerUsecase.get(user);
    await addTarget(params);
    getData(params);
    params.creator = composedUser;
    

    return params;
  }

  Future addTarget(AmityStory story) async  {
    if (story.targetType == AmityStoryTargetType.COMMUNITY) {
      story.target = storyTargetRepo.getStoryTargetLocal(story.targetType!, story.targetId!,);
      if( story.target!=null){story.target = await  storyTargetComposerUseCase.get(story.target!);}
    }
  }


  Future getData(AmityStory story) async {
    AmityStoryData storyData = UnknownStoryData();
    switch (story.dataType) {
      case AmityStoryDataType.IMAGE:
        storyData = ImageStoryData(
            storyId: story.storyId!,
            rawData: story.rawData!,
            imageDisplayMode: AmityStoryImageDisplayModeExtension.enumOf(
                story.rawData?["imageDisplayMode"]),
            image: await getImageFile(story));
        break;
      case AmityStoryDataType.VIDEO:
        storyData = VideoStoryData(
            storyId: story.storyId!,
            rawData: story.rawData!,
            video: await getVideoFile(story),
            thumbnail: await getThumbnailFile(story));
        break;
      default:
        storyData = UnknownStoryData();
    }

    story.data = storyData;
  }

  Future<AmityVideo> getVideoFile(AmityStory story) async {
    var fileProperties =
        await fileRepo.getFileByIdFromDb(getVideoId( story.rawData));
    return AmityVideo(fileProperties);
  }



  Future<AmityImage> getImageFile(AmityStory story) async {
    var fileProperties =
        await fileRepo.getFileByIdFromDb(getImageId(story.rawData));
    return AmityImage(fileProperties);
  }

  Future<AmityImage> getThumbnailFile(AmityStory story) async {
    var fileProperties =
        await fileRepo.getFileByIdFromDb(getThumbnailId(story.rawData));
    return AmityImage(fileProperties);
  }

  String getVideoId(Map<String, dynamic>? rawData) {
    return rawData?["videoFileId"]?["original"] ?? rawData?["fileId"];
  }

  String getImageId(Map<String, dynamic>? rawData) {
    return rawData?["fileId"] ?? "";
  }

  String getThumbnailId(Map<String, dynamic>? rawData) {
    return rawData?["thumbnailFileId"] ?? "";
  }
}
