import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data.dart';

class PagingIdInsertUsecase extends ProcessingUseCase<void, PagingIdHiveEntity> {
  final PagingIdDbAdapter pagingIdDbAdapter;
  PagingIdInsertUsecase(
      {required this.pagingIdDbAdapter});

  @override
  Future process(PagingIdHiveEntity params) async {
    return await pagingIdDbAdapter.savePagingIdEntity(params);
  }
}
