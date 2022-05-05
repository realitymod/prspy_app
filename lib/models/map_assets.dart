import 'package:prspy/models/asset_position.dart';
import 'package:prspy/models/asset_rotation.dart';

///
///
///
class MapAssets {
  late String key;
  late int initialDelay;
  late int respawnDelay;
  late int team;
  late AssetPosition position;
  late AssetRotation rotation;

  ///
  ///
  ///
  MapAssets.fromJson(Map<String, dynamic> map) {
    key = map['Key'];
    initialDelay = map['InitialDelay'];
    respawnDelay = map['RespawnDelay'];
    team = map['Team'];
    position = AssetPosition.fromJson(map['Position']);
    rotation = AssetRotation.fromJson(map['Rotation']);
  }
}
