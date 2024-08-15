import 'dart:developer';
import 'dart:io' as io;

import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/engine/analytics_engine.dart';
import 'package:amity_sdk/src/core/session/event_bus/app_event_bus.dart';
import 'package:amity_sdk/src/core/session/event_bus/session_life_cycle_event_bus.dart';
import 'package:amity_sdk/src/core/session/event_bus/session_state_event_bus.dart';
import 'package:amity_sdk/src/core/session/model/app_event.dart';
import 'package:amity_sdk/src/core/session/model/session_life_cycle.dart';
import 'package:amity_sdk/src/core/session/model/session_state.dart';
import 'package:amity_sdk/src/core/session/session_state_manager.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/model/amity_notification_settings/amity_notification.dart';
import 'package:amity_sdk/src/domain/usecase/network/validate_text_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/network/validate_urls_usecase.dart';
import 'package:amity_sdk/src/public/public.dart';
import 'package:amity_sdk_api/amity_sdk_api.dart';
import 'package:device_info_plus/device_info_plus.dart';


///Amity Core Client to do primary Setup
class AmityCoreClient {
  static SessionStateManager? _sessionStateManager;
  static SessionLifeCycleEventBus? _sessionLifeCycleEventBus;
  static AppEventBus? _appEventBus;
  static SessionStateEventBus? _sessionStateEventBus;
  static SessionState currentSessionState = SessionState.NotLoggedIn;
  static AnalyticsEngine? analyticsEngine = null;

  ///Do the intial set
  static Future setup({
    required AmityCoreClientOption option,
    bool sycInitialization = false,
  }) async {

    AmityCoreClientOption setupOption = option;

    //Reset config get_it instance
    await configServiceLocator.reset();

    //Reset SDK get_it instance
    await serviceLocator.reset();

    if (io.Platform.isAndroid) {
      try {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

        // Switch to compatible endpoint for Android 7.1.1 and below [https://ekoapp.atlassian.net/browse/ASC-24966
        if (androidInfo.version.sdkInt <= 25) {
          final httpEndpoint = option.httpEndpoint;
          switch(httpEndpoint){
            case AmityRegionalHttpEndpoint.SG:
              setupOption = option.copyWith(httpEndpoint: AmityRegionalHttpEndpoint.custom(SG_HTTP_COMPAT_ENDPOINT));
              break;
            case AmityRegionalHttpEndpoint.EU:
              setupOption = option.copyWith(httpEndpoint: AmityRegionalHttpEndpoint.custom(EU_HTTP_COMPAT_ENDPOINT));
              break;
            case AmityRegionalHttpEndpoint.US:
              setupOption = option.copyWith(httpEndpoint: AmityRegionalHttpEndpoint.custom(US_HTTP_COMPAT_ENDPOINT));
              break;
          }
        }
      } catch (e) {
        log("Failed to get platform version: $e");
      }
    }

    configServiceLocator
        .registerLazySingleton<AmityCoreClientOption>(() => setupOption);

    await SdkServiceLocator.initServiceLocator(syc: sycInitialization);

    _intialCleanUp();
    setupSessionComponents();

    return;
  }

  static void setupSessionComponents() {
    _sessionLifeCycleEventBus ??= SessionLifeCycleEventBus();
    _appEventBus ??= AppEventBus();
    _sessionStateEventBus ??= SessionStateEventBus();
    _sessionStateManager ??= SessionStateManager(
        appEventBus: _appEventBus!,
        sessionStateEventBus: _sessionStateEventBus!,
        sessionLifeCycleEventBus: _sessionLifeCycleEventBus!);

    analyticsEngine = AnalyticsEngine(
      sessionLifeCycleEventBus: _sessionLifeCycleEventBus!,
      sessionStateEventBus: _sessionStateEventBus!,
    );
  }

  /* begin_public_function 
  id: client.login
  api_style: async
  */
  /// Login with userId, this will create user session
  static LoginQueryBuilder login(String userId) {
    return LoginQueryBuilder(useCase: serviceLocator(), userId: userId, sessionLifeCycleEventBus: _sessionLifeCycleEventBus!, appEventBus: _appEventBus!);
  }
  /* end_public_function */

  /* begin_public_function 
  id: client.logout
  */
  /// Logout will wipe out all the data [AmityCoreClient] holds.
  static Future<void> logout() async {
    //terminate current activeSocket
    serviceLocator<AmitySocket>().terminate();
    _sessionLifeCycleEventBus!.publish(SessionLifeCycle.Destroy);
    _appEventBus!.publish(AppEvent.ManualLogout);
    //close all the hive boxes and wipe the data
    await serviceLocator<DBClient>().reset();

    //Reload the service locator
    await SdkServiceLocator.reloadServiceLocator();

    return;
  }
  /* end_public_function */



  Future<bool> validateUrls(List<String> urls)  async  {
        return await  ValidateUrlsUseCase(networkSettingsRepo: serviceLocator()).get(urls);
    }

    Future<bool>  validateTexts( List<String> texts) async  {
        return await  ValidateTextsUseCase(networkSettingsRepo: serviceLocator()).get(texts);
    }

  /* begin_public_function 
  id: client.disconnect
  */
  ///temporarily disconnect chat real-time events from the system,
  //call the function 'login(String userId)' to restore a connection
  static void disconnect() {
    serviceLocator<AmitySocket>().terminate();
  }
  /* end_public_function */

  ///Check if user is logged in
  static bool isUserLoggedIn(){
    try {
      getCurrentUser();
      return true;
    } catch (error) {
      return false;
    }
  }

  ///Get logged in user id
  ///if user is not logged in this method will Through [AmityException]
  static String getUserId() {
    return getCurrentUser().userId!;
  }

  /* begin_public_function 
  id: client.get_current_user
  */
  ///Get logged in user
  ///if user is not logged in this method will Through [AmityException]
  static AmityUser getCurrentUser() {
    // serviceLocator<AccountDbAdapter>().getAccountEntity(userId)
    if (serviceLocator.isRegistered<AmityUser>()) {
      return serviceLocator<AmityUser>();
    }
    throw AmityException(
      message: 'App dont have active user, Please login',
      code: 401,
    );
  }
  /* end_public_function */

  /* begin_public_function 
  id: client.get_configuration
  */
  static AmityClientConfiguration getConfiguration() {
    return AmityClientConfiguration(serviceLocator<StreamFunctionInterface>());
  }
  /* end_public_function */

  /* begin_public_function 
  id: client.update_user
  api_style: async
  */
  /// API to update the user
  UserUpdateQueryBuilder updateUser() {
    return UserUpdateQueryBuilder(
        serviceLocator<UpdateUserUsecase>(), getUserId());
  }
  /* end_public_function */

  /* begin_public_function 
  id: client.register_push
  */
  ///Register the devie to receive FCM token
  static Future registerDeviceNotification(String fcmToken) {
    return serviceLocator<NotificationRepository>()
        .registerDeviceNotification(fcmToken);
  }
  /* end_public_function */

  /* begin_public_function 
  id: client.unregister_push
  */
  ///Unregister the device with FCM
  static Future unregisterDeviceNotification() {
    return serviceLocator<NotificationRepository>()
        .unregisterDeviceNotification();
  }
  /* end_public_function */


  /* begin_public_function
	  id: client.notifications
	*/
    AmityNotification notifications()  {
        return AmityNotification();
    }
    /* end_public_function */

  /// Check if Current user have the permissions
  static AmityPermissionValidator hasPermission(AmityPermission permission) {
    return AmityPermissionValidator(permission);
  }

  /// Create new User Repository
  static UserRepository newUserRepository() => serviceLocator<UserRepository>();

  /// Create new File Repository
  static AmityFileRepository newFileRepository() =>
      serviceLocator<AmityFileRepository>();

  /// Intial Clean for SDK
  static _intialCleanUp() {
    // Remove all the Syncing State Message (Unsend messages)
    serviceLocator<MessageDbAdapter>()
        .getUnsendMessages()
        .forEach((element) => element.delete());
  }

  static AnalyticsEngine? getAnalyticsEngine() {
    return analyticsEngine;
  }
}

/// This class is AmityCore option to do initial setup Amity
class AmityCoreClientOption {
  /// network Apikey
  final String apiKey;

  /// Http endpoint for amity client
  final AmityRegionalHttpEndpoint httpEndpoint;

  /// Socket endpoint for amity client
  final AmityRegionalSocketEndpoint socketEndpoint;

  /// MQTT endpoint for amity client
  final AmityRegionalMqttEndpoint mqttEndpoint;

  /// flag to show logs for debug, by default it false
  final bool showLogs;

  /// Amity Core Client Options to do initial Amity Client
  AmityCoreClientOption({
    required this.apiKey,
    this.httpEndpoint = AmityRegionalHttpEndpoint.SG,
    this.socketEndpoint = AmityRegionalSocketEndpoint.SG,
    this.mqttEndpoint = AmityRegionalMqttEndpoint.SG,
    this.showLogs = false,
  });

  AmityCoreClientOption copyWith({
    String? apiKey,
    AmityRegionalHttpEndpoint? httpEndpoint,
    AmityRegionalSocketEndpoint? socketEndpoint,
    AmityRegionalMqttEndpoint? mqttEndpoint,
    bool? showLogs,
  }) {
    return AmityCoreClientOption(
      apiKey: apiKey ?? this.apiKey,
      httpEndpoint: httpEndpoint ?? this.httpEndpoint,
      socketEndpoint: socketEndpoint ?? this.socketEndpoint,
      mqttEndpoint: mqttEndpoint ?? this.mqttEndpoint,
      showLogs: showLogs ?? this.showLogs,
    );
  }
}
