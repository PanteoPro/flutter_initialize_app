import 'package:web/web.dart' as web;
import 'platform.dart';

PlatformInfo getPlatformInfo() {
  return PlatformInfo(
    isWeb: true,
    isRelease: const bool.fromEnvironment('dart.vm.product'),
    operatingSystem: _getOperatingSystem(),
    numberOfProcessors: web.window.navigator.hardwareConcurrency,
    locale: web.window.navigator.language,
    version: web.window.navigator.userAgent,
  );
}

String _getOperatingSystem() {
  final userAgent = web.window.navigator.userAgent.toLowerCase();
  if (userAgent.contains('windows')) return 'windows';
  if (userAgent.contains('macintosh')) return 'macos';
  if (userAgent.contains('linux')) return 'linux';
  if (userAgent.contains('android')) return 'android';
  if (userAgent.contains('ios')) return 'ios';
  return 'unknown';
}
