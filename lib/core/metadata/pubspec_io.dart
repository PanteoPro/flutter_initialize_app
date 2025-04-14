import 'dart:io';
import 'package:yaml/yaml.dart';

Future<Map<String, dynamic>> loadPubspecInfo() async {
  final pubspecFile = File('pubspec.yaml');
  final pubspecContent = loadYaml(await pubspecFile.readAsString());
  return pubspecContent as Map<String, dynamic>;
}
