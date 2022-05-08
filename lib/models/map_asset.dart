///
///
///
class MapAsset {
  late String key;
  late double initialDelay;
  late double respawnDelay;
  late int team;
  late String name;
  String? icon;
  int amount = 1;

  ///
  ///
  ///
  MapAsset.fromJson(Map<String, dynamic> map) {
    key = map['Key'];
    initialDelay = map['InitialDelay'];
    respawnDelay = map['RespawnDelay'];
    team = map['Team'];
  }

  ///
  ///
  ///
  String get respawnDelayConverted {
    if (respawnDelay == 0 || respawnDelay > 9999) {
      return 'No respawn';
    }
    return '${_convertToMinutes(respawnDelay)} minutes';
  }

  ///
  ///
  ///
  String get getIconAssetPath => 'assets/images/asset_icons/$icon.png';

  ///
  ///
  ///
  String get initialDelayConverted {
    if (initialDelay == 0.0) {
      return 'No delay';
    }
    return '${_convertToMinutes(initialDelay)} minutes';
  }

  ///
  ///
  ///
  int _convertToMinutes(double seconds) => seconds ~/ 60;
}
