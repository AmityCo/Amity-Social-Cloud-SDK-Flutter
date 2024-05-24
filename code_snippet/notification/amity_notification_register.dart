import 'package:amity_sdk/amity_sdk.dart';

class AmityNotificationRegister {
  /* begin_sample_code
    gist_id: f3ff0205f7d7c9e94747cf13ea14028b
    filename: AmityNotificationRegister.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter register notification example
    */
  void registerNotification(String fcmToken) {
    /* 

    ************ IMPORTANT ************
    Example of getting token from firebase.
    Please check the platform before getting the token and send token as per platform. 
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      if (Platform.isIOS) {
        final fcmToken = await messaging.getAPNSToken();
      } else {
        final fcmToken = await messaging.getToken();
      }
    
    */
    AmityCoreClient.registerDeviceNotification(fcmToken)
        .then((value) => {
              //success
            })
        .onError((error, stackTrace) => {
              //handle error
            });
  }
  /* end_sample_code */
}
