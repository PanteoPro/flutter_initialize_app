import 'package:http/http.dart' as http;
import 'package:yaml/yaml.dart';

Future<Map<String, dynamic>> loadPubspecInfo() async {
  try {
    final response = await http.get(Uri.parse('/pubspec.yaml'));
    if (response.statusCode == 200) {
      final content = loadYaml(response.body);
      return content as Map<String, dynamic>;
    }
    throw Exception('Failed to load pubspec.yaml');
  } catch (e) {
    // Fallback to default values if fetch fails
    return {
      'name': 'initialize_app',
      'version': '1.0.0+1',
    };
  }
}
