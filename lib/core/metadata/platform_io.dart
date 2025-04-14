import 'dart:io';
import 'platform.dart';

PlatformInfo getPlatformInfo() {
  return PlatformInfo(
    isWeb: false,
    isRelease: const bool.fromEnvironment('dart.vm.product'),
    operatingSystem: Platform.operatingSystem,
    numberOfProcessors: Platform.numberOfProcessors,
    locale: Platform.localeName,
    version: Platform.operatingSystemVersion,
  );
}
