///
///
///
class MapAssets {
  late String key;
  late int initialDelay;
  late int respawnDelay;
  late int team;

  ///
  ///
  ///
  MapAssets.fromJson(Map<String, dynamic> map) {
    key = map['Key'];
    initialDelay = map['InitialDelay'];
    respawnDelay = map['RespawnDelay'];
    team = map['Team'];
  }
}
