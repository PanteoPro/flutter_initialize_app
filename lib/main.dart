import 'dart:async';

import 'package:flutter/material.dart';
import 'package:initialize_app/core/app/app.dart';
import 'package:initialize_app/core/app/error_app.dart';
import 'package:initialize_app/core/app/loading_app.dart';
import 'package:initialize_app/core/di/di_container.dart';
import 'package:initialize_app/core/di/di_container_provider.dart';
import 'package:initialize_app/core/metadata/app_metadata.dart';
import 'package:initialize_app/core/metadata/platform.dart';
import 'package:initialize_app/core/metadata/pubspec.dart';
import 'package:initialize_app/core/utils/logger.dart';
import 'package:initialize_app/core/metadata/pubspec_io.dart'
    if (dart.library.html) 'package:initialize_app/core/metadata/pubspec_web.dart';

final logger = AppLogger.getLogger('Main');

void main() {
  runZonedGuarded(() async {
    final progressNotifier = ValueNotifier<(int, String)>((0, ''));
    final initializeCompleted = Completer<DiContainer>();

    $initializeApp(
      onProgress: (progress, message) {
        progressNotifier.value = (progress, message);
      },
      onError: (error, stackTrace) {
        logger.severe('Failed to initialize app', error, stackTrace);
      },
      onSuccess: (dependencies) {
        initializeCompleted.complete(dependencies);
      },
    );
    runApp(LoadingApp(progressNotifier: progressNotifier));

    final dependencies = await initializeCompleted.future;
    runApp(
      DiContainerProvider(
        diContainer: dependencies,
        child: App(),
      ),
    );
    logger.info('Application started successfully');
  }, (error, stack) {
    logger.severe('Unhandled error in root zone', error, stack);
    runApp(
      ErrorApp(
        error: error.toString(),
        stackTrace: stack.toString(),
      ),
    );
  });
}

Future<DiContainer> $initializeApp({
  void Function(DiContainer container)? onSuccess,
  void Function(Object error, StackTrace stackTrace)? onError,
  void Function(int progress, String message)? onProgress,
}) async {
  final stopwatch = Stopwatch()..start();
  try {
    WidgetsFlutterBinding.ensureInitialized();

    // catch errors

    final dependencies = await $initializeDependencies(
      onProgress: onProgress,
    ).timeout(Duration(minutes: 5));
    onSuccess?.call(dependencies);
    return dependencies;
  } on Object catch (e, stackTrace) {
    onError?.call(e, stackTrace);
    throw Exception('Failed to initialize app: $e');
  } finally {
    stopwatch.stop();
  }
}

Future<DiContainer> $initializeDependencies({
  void Function(int progress, String message)? onProgress,
}) async {
  final dependencies = $MutableDiContainer();
  final totalSteps = $initializeDependenciesMap.length;
  var currentStep = 0;
  onProgress?.call(0, 'Initializing dependencies');
  for (final step in $initializeDependenciesMap.entries) {
    await step.value(dependencies);
    currentStep++;
    final percent = (currentStep * 100 / totalSteps).clamp(0, 100);
    onProgress?.call(percent.toInt(), step.key);
    logger.info(
        'Initialize progress: $currentStep/$totalSteps ($percent%) | "${step.key}"');
  }
  return dependencies.freezed();
}

Map<String, FutureOr<void> Function(DiContainer)> $initializeDependenciesMap = {
  "Initialize logger": (_) async {
    await Future.delayed(Duration(seconds: 1));
    AppLogger.initialize();
  },
  "Platform pre-initialization": (_) async {
    await Future.delayed(Duration(seconds: 1));
  },
  "Creating app metadata": (dependencies) async {
    await Future.delayed(Duration(seconds: 1));
    final platform = PlatformInfo.current();
    final pubspecContent = await loadPubspecInfo();
    final pubspec = PubspecInfo.fromYaml(pubspecContent);

    dependencies.appMetadata = AppMetadata(
      isWeb: platform.isWeb,
      isRelease: platform.isRelease,
      appName: pubspec.name,
      appVersion: pubspec.version,
      appVersionMajor: pubspec.major,
      appVersionMinor: pubspec.minor,
      appVersionPatch: pubspec.patch,
      appBuildTimestamp:
          pubspec.build.isNotEmpty ? int.tryParse(pubspec.build) ?? -1 : -1,
      operatingSystem: platform.operatingSystem,
      processorsCount: platform.numberOfProcessors,
      appLaunchedTimestamp: DateTime.now(),
      locale: platform.locale,
      deviceVersion: platform.version,
    );
    logger.info('App metadata: ${dependencies.appMetadata}');
  },
  "Observer state management": (dependencies) async {
    await Future.delayed(Duration(seconds: 1));
  },
  "Initialize analytics": (dependencies) async {
    await Future.delayed(Duration(seconds: 1));
  },
  "Get remote config": (dependencies) async {
    await Future.delayed(Duration(seconds: 1));
  },
  "Initialize database": (dependencies) async {
    await Future.delayed(Duration(seconds: 1));
  },
  "Shrink database": (dependencies) async {
    await Future.delayed(Duration(seconds: 1));
  },
};
