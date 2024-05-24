import 'package:amity_sdk/amity_sdk.dart';

class AmityVerifyUrl{
  /* begin_sample_code
    gist_id: 032d9b4555e50c85d32dfec9774cd70e
    filename: AmityVerifyUrl.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter verify url example
    */

  void verifyUrl( List<String> urls ){
    AmityCoreClient().validateUrls(urls).then((value) {
      // Passes validation
    }).then((value){
      // Fails validation
    });
  }


  /* end_sample_code */

}