import 'package:amity_sdk/amity_sdk.dart';

class AmityVerifyText {
  /* begin_sample_code
    gist_id: 0e3203b56dabdbaff0c8f42f5bbddb76
    filename: AmityVerifyText.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter verify text example
    */

  void verifyText(List<String> texts) {
    AmityCoreClient().validateTexts(texts).then((value) {
      // Passes validation
    }).then((value){
      // Fails validation
    });
  }

  /* end_sample_code */
}
