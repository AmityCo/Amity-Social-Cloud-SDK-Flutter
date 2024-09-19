import 'dart:async';

import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/extension/stream_controller_extendion.dart';

typedef RequestBuilder<T> = T Function();

/// Live Collection Abs layer
abstract class LiveCollection<Model> {
  /// Current Token (Next page token)
  String? currentToken;

  /// if live collection fetching next page
  bool isFetching = false;

  /// Check if first page is loaded
  bool _isFirstPage = true;

  final defaultPageSize = 20;

  /// get the next page request
  Future<PageListData<List<Model>, String>> getNextPageRequest(String? token);

  /// get the first page request( with out token)
  Future<PageListData<List<Model>, String>> getFirstPageRequest();

  /// Listen to live collection
  StreamController<List<Model>> getStreamController();

  final StreamController<bool> _loadingStateStream = StreamController<bool>();

  /// On Error Callback
  Function(Object? error, StackTrace stackTrace)? _onErrorCallback;

  /// OnError
  void onError(Function(Object? error, StackTrace stackTrace) onErrorCallback) {
    _onErrorCallback = onErrorCallback;
  }

  LiveCollection() {
    _loadingStateStream.add(true);
  }

  /// Load next page for live collection
  Future loadNext() async {
    if(!_isFirstPage && !hasNextPage()) {
      return;
    }

    if (!isFetching) {
      isFetching = true;
      _loadingStateStream.add(true);
      _loadingStateStream.addData(true);
      if (_isFirstPage) {
        return await getFirstPageRequest().then((value) {
          currentToken = value.token;
          isFetching = false;
          _loadingStateStream.addData(false);
          _isFirstPage = false;
        }).onError((error, stackTrace) {
          isFetching = false;
          _loadingStateStream.addData(false);
          _isFirstPage = false;
          if (_onErrorCallback != null) {
            _onErrorCallback!(error, stackTrace);
          }
        });
      } else {
        return await getNextPageRequest(currentToken).then((value) {
          currentToken = value.token;
          isFetching = false;
          _loadingStateStream.addData(false);
          _isFirstPage = false;
        }).onError((error, stackTrace) {
          isFetching = false;
          _loadingStateStream.addData(false);
          if (_onErrorCallback != null) {
            _onErrorCallback!(error, stackTrace);
          }
        });
      }
    }
  }

  /// Check if live collection have next page
  bool hasNextPage() {
    final hasNextToken =
        currentToken != null && (currentToken ?? '').isNotEmpty;
    return hasNextToken && !_isFirstPage;
  }

  /// Reset the live collection
  bool reset() {
    currentToken = null;
    isFetching = false;
    _isFirstPage = true;
    _loadingStateStream.addData(false);
    return true;
  }

  /// Observe Loading State
  Stream<bool> observeLoadingState() {
    return _loadingStateStream.stream;
  }

  Future<void> dispose() async {
    await _loadingStateStream.close();
    return getStreamController().close();
  }
}
