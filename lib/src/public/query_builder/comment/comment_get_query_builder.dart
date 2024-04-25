import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/utils/comment_live_collection.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class AmityCommentQueryTypeSelector {
  late CommentQueryUseCase _useCase;
  AmityCommentQueryTypeSelector({required CommentQueryUseCase useCase}) {
    _useCase = useCase;
  }
  AmityCommentQueryBuilder post(String postId) {
    return AmityCommentQueryBuilder(useCase: _useCase)
        .referenceId(postId)
        .referenceType(AmityCommentReferenceType.POST.value);
  }

  AmityCommentQueryBuilder story(String story) {
    return AmityCommentQueryBuilder(useCase: _useCase)
        .referenceId(story)
        .referenceType(AmityCommentReferenceType.STORY.value);
  }

  AmityCommentQueryBuilder content(String contentId) {
    return AmityCommentQueryBuilder(useCase: _useCase)
        .referenceId(contentId)
        .referenceType(AmityCommentReferenceType.CONTENT.value);
  }
}

class AmityCommentQueryBuilder {
  late CommentQueryUseCase _useCase;
  late String _referenceType;
  late String _referenceId;

  String? _parentId = null;
  bool? _isDeleted;
  AmityCommentSortOption _sortOption = AmityCommentSortOption.LAST_CREATED;

  AmityCommentDataTypeFilter? dataTypeFilter;

  AmityCommentQueryBuilder({required CommentQueryUseCase useCase}) {
    _useCase = useCase;
  }

  AmityCommentQueryBuilder referenceType(String referenceType) {
    _referenceType = referenceType;
    return this;
  }

  AmityCommentQueryBuilder referenceId(String referenceId) {
    _referenceId = referenceId;
    return this;
  }

  AmityCommentQueryBuilder includeDeleted(bool includeDeleted) {
    if (!includeDeleted) {
      _isDeleted = false;
    }
    return this;
  }

  /// Get the comment with parent ID
  AmityCommentQueryBuilder parentId(String? parentId) {
    _parentId = parentId;
    return this;
  }

  AmityCommentQueryBuilder filterById(bool isFilterByParentId) {
    return this;
  }

  /// Sort the comment by [AmityCommentSortOption]
  AmityCommentQueryBuilder sortBy(AmityCommentSortOption sortOption) {
    _sortOption = sortOption;
    return this;
  }

  AmityCommentQueryBuilder dataTypes(AmityCommentDataTypeFilter? filter) {
    dataTypeFilter = filter;
    return this;
  }

  Future<PageListData<List<AmityComment>, String>> getPagingData(
      {String? token, int? limit}) {
        GetCommentRequest getCommentRequest = GetCommentRequest(
        referenceId: _referenceId, referenceType: _referenceType);

    if (_parentId != null) {
      getCommentRequest.parentId = _parentId;
      getCommentRequest.filterByParentId = true;
    } else {
      getCommentRequest.filterByParentId = false;
    }

    getCommentRequest.isDeleted = _isDeleted ?? true ? null : false;

    if (dataTypeFilter != null) {
      getCommentRequest.dataTypes =
          dataTypeFilter!.dataTypes.map((e) => e.value).toList();
      getCommentRequest.matchType = dataTypeFilter!.matchType;
    }

    getCommentRequest.sortBy = _sortOption.apiKey;

    OptionsRequest options = OptionsRequest();
    getCommentRequest.options = options;
    options.type = 'pagination'; //Default option

    if (token != null) {
      getCommentRequest.options!.token = token;
    }
    if (limit != null) {
      getCommentRequest.options!.limit = limit;
    }
    
    return _useCase.get(getCommentRequest);
  }

  GetCommentRequest build({int? pageSize = 20}) {
    GetCommentRequest getCommentRequest = GetCommentRequest(
        referenceId: _referenceId, referenceType: _referenceType);

    if (_parentId != null) {
      getCommentRequest.parentId = _parentId;
      getCommentRequest.filterByParentId =  true;
    } else {
      getCommentRequest.filterByParentId = false;
    }

    getCommentRequest.isDeleted = _isDeleted ?? true ? null : false;

    if (dataTypeFilter != null) {
      getCommentRequest.dataTypes =
          dataTypeFilter!.dataTypes.map((e) => e.value).toList();
      getCommentRequest.matchType = dataTypeFilter!.matchType;
    }

    getCommentRequest.sortBy = _sortOption.apiKey;

    OptionsRequest options = OptionsRequest();
    getCommentRequest.options = options;
    options.type = 'pagination'; //Default option
    getCommentRequest.options?.limit = pageSize;

    return getCommentRequest;
  }

  /// Query the comment list
  Future<List<AmityComment>> query({String? token, int? limit = 20}) async {
    final data =
        await  _useCase.get(build(pageSize: limit)..options!.token = token);

    return data.data;
  }

  CommentLiveCollection getLiveCollection({int? pageSize = 20}) {
    return CommentLiveCollection(request: (() => build(pageSize: pageSize)));
  }

}

class AmityCommentDataTypeFilter {
  final List<AmityDataType> dataTypes;
  final String matchType;

  AmityCommentDataTypeFilter._internal(this.dataTypes, this.matchType);

  factory AmityCommentDataTypeFilter.any(
          {required List<AmityDataType> dataTypes}) =>
      AmityCommentDataTypeFilter._internal(dataTypes, 'any');

  factory AmityCommentDataTypeFilter.exact(
          {required List<AmityDataType> dataTypes}) =>
      AmityCommentDataTypeFilter._internal(dataTypes, 'exact');
}
