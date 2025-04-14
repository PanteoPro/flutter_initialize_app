class AppMetadata {
  final bool isWeb;
  final bool isRelease;
  final String appName;
  final String appVersion;
  final String appVersionMajor;
  final String appVersionMinor;
  final String appVersionPatch;
  final int appBuildTimestamp;
  final String operatingSystem;
  final int processorsCount;
  final DateTime appLaunchedTimestamp;
  final String locale;
  final String deviceVersion;

  AppMetadata({
    required this.isWeb,
    required this.isRelease,
    required this.appName,
    required this.appVersion,
    required this.appVersionMajor,
    required this.appVersionMinor,
    required this.appVersionPatch,
    required this.appBuildTimestamp,
    required this.operatingSystem,
    required this.processorsCount,
    required this.appLaunchedTimestamp,
    required this.locale,
    required this.deviceVersion,
  });

  @override
  String toString() {
    return 'AppMetadata(isWeb: $isWeb, isRelease: $isRelease, appName: $appName, appVersion: $appVersion, appVersionMajor: $appVersionMajor, appVersionMinor: $appVersionMinor, appVersionPatch: $appVersionPatch, appBuildTimestamp: $appBuildTimestamp, operatingSystem: $operatingSystem, processorsCount: $processorsCount, appLaunchedTimestamp: $appLaunchedTimestamp, locale: $locale, deviceVersion: $deviceVersion)';
  }
}
