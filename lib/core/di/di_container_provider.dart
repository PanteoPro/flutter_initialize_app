import 'package:flutter/material.dart';

import 'di_container.dart';

class DiContainerProvider extends InheritedWidget {
  const DiContainerProvider({
    super.key,
    required super.child,
    required this.diContainer,
  });

  final DiContainer diContainer;

  static DiContainer of(BuildContext context) {
    var provider = context.findAncestorWidgetOfExactType<DiContainerProvider>();
    assert(provider != null, 'DiContainerProvider not found');
    return provider!.diContainer;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
