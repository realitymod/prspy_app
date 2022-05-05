///
///
///
class MapAsset {
  late String key;
  late int initialDelay;
  late int respawnDelay;
  late int team;
  late String name;

  ///
  ///
  ///
  MapAsset.fromJson(Map<String, dynamic> map) {
    key = map['Key'];
    initialDelay = map['InitialDelay'];
    respawnDelay = map['RespawnDelay'];
    team = map['Team'];
  }
}
