///
///
///
class Config {
  static Config _config = Config._internal();

  ///
  ///
  ///
  factory Config() {
    return _config;
  }

  ///
  ///
  ///
  Config._internal();

  bool hideEmptyServers = false;
  bool hidePasswordedServers = false;
  bool hideCoopServers = false;
}
