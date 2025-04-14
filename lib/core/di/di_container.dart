import 'package:initialize_app/core/metadata/app_metadata.dart';

abstract class DiContainer {
  AppMetadata get appMetadata;
  set appMetadata(AppMetadata value);
}

class $MutableDiContainer implements DiContainer {
  late AppMetadata appMetadata;

  DiContainer freezed() => $ImmutableDiContainer(appMetadata: appMetadata);
}

class $ImmutableDiContainer extends DiContainer {
  $ImmutableDiContainer({
    required this.appMetadata,
  });

  @override
  late final AppMetadata appMetadata;
}
