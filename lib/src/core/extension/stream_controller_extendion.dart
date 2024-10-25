import 'dart:async';

extension StreamControllerExtendion on StreamController {
  
  /// Secure adding data to StreamController
  void addData(data) {
    if (!isClosed) {
      add(data);
    }
  }
}