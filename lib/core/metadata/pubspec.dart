class PubspecInfo {
  final String name;
  final String version;
  final String major;
  final String minor;
  final String patch;
  final String build;

  PubspecInfo({
    required this.name,
    required this.version,
    required this.major,
    required this.minor,
    required this.patch,
    required this.build,
  });

  factory PubspecInfo.fromYaml(Map<String, dynamic> yaml) {
    final version = yaml['version'] as String? ?? '0.0.0';
    final parts = version.split('+');
    final versionParts = parts[0].split('.');

    return PubspecInfo(
      name: yaml['name'] as String? ?? '',
      version: version,
      major: versionParts.isNotEmpty ? versionParts[0] : '0',
      minor: versionParts.length > 1 ? versionParts[1] : '0',
      patch: versionParts.length > 2 ? versionParts[2] : '0',
      build: parts.length > 1 ? parts[1] : '',
    );
  }
}
