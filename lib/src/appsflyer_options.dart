import 'package:flutter/foundation.dart';

import '../appsflyer_sdk.dart';

class AppsFlyerOptions {
  /// Retreive from the AppsFlyer dashboard config
  final String afDevKey;

  /// The max timeout to wait before submitting events to AppsFlyer
  ///
  /// Make sure to configure App Tracking Transparency (ATT) on iOS to prompt
  /// the user for permission to use their (Identifier for Advertisers) IDFA
  /// which is now opt-in as of iOS 14.
  ///
  /// Refer to :https://support.appsflyer.com/hc/en-us/articles/207032066#integration-33-configuring-app-tracking-transparency-att-support
  final double timeToWaitForATTUserAuthorization;
  final String appInviteOneLink;
  final bool disableAdvertisingIdentifier;
  final bool disableCollectASA;

  /// Keep this set to `true` in release mode
  ///
  /// Without [showDebug], errors will not be printed to the console
  ///
  /// Open `Console` on your Mac and filter for `AppsFlyer:` to see logs
  final bool showDebug;

  /// App Id on ios (remove the ID prefix) and your package name on Android
  final String appId;

  AppsFlyerOptions({
    @required this.afDevKey,
    this.appInviteOneLink,
    this.disableAdvertisingIdentifier = false,
    this.disableCollectASA = false,
    this.showDebug = true,
    this.appId = "",
    this.timeToWaitForATTUserAuthorization = 120, // seconds
  });

  Map<String, dynamic> toJson() {
    return {
      AppsflyerConstants.afDevKey: afDevKey,
      AppsflyerConstants.afTimeToWaitForAttUserAuthorization:
          timeToWaitForATTUserAuthorization,
      AppsflyerConstants.afInviteOneLink: appInviteOneLink,
      AppsflyerConstants.disableAdvertisingIdentifier:
          disableAdvertisingIdentifier,
      AppsflyerConstants.disableCollectASA: disableCollectASA,
      AppsflyerConstants.afIsDebug: showDebug,
      AppsflyerConstants.afAppId: appId,
    };
  }
}
