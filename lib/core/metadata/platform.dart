import 'platform_io.dart' if (dart.library.html) 'platform_web.dart';

class PlatformInfo {
  final bool isWeb;
  final bool isRelease;
  final String operatingSystem;
  final int numberOfProcessors;
  final String locale;
  final String version;

  PlatformInfo({
    required this.isWeb,
    required this.isRelease,
    required this.operatingSystem,
    required this.numberOfProcessors,
    required this.locale,
    required this.version,
  });

  factory PlatformInfo.current() {
    return getPlatformInfo();
  }
}
