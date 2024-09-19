import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class PostQueryUsecase
    extends UseCase<PageListData<List<AmityPost>, String>, GetPostRequest> {
  final PostRepo postRepo;
  final PostComposerUsecase postComposerUsecase;
  PostQueryUsecase({required this.postRepo, required this.postComposerUsecase});

  @override
  Future<PageListData<List<AmityPost>, String>> get(
      GetPostRequest params) async {
    return await postRepo.queryPostList(params);
  }
}
