import 'package:enum_to_string/enum_to_string.dart';

enum Flavor { dev, stag, prod }

class Constants {
  const Constants({
    required this.endpoint,
    required this.apiKey,
  });

  factory Constants.shared() {
    if (_instance != null) {
      return _instance!;
    }
    final flavor = EnumToString.fromString(
        Flavor.values, const String.fromEnvironment('FLAVOR'));
    switch (flavor) {
      case Flavor.prod:
        return Constants._prod();

      case Flavor.stag:
        return Constants._stag();

      case Flavor.dev:
      default:
        return Constants._dev();
    }
  }

  factory Constants._dev() {
    return const Constants(
      endpoint: 'http://54.238.229.185/api',
      apiKey: 'd61431a2fb64b6e56c6f086952e63ab6',
    );
  }

  factory Constants._prod() {
    return const Constants(
      endpoint: 'http://54.238.229.185/api',
      apiKey: 'd61431a2fb64b6e56c6f086952e63ab6',
    );
  }

  factory Constants._stag() {
    return const Constants(
      endpoint: 'http://54.238.229.185/api',
      apiKey: 'd61431a2fb64b6e56c6f086952e63ab6',
    );
  }

  final String endpoint;
  final String apiKey;

  static Constants? _instance;
}
