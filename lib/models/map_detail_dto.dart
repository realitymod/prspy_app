// To parse this JSON data, do
//
//     final mapGallery = mapGalleryFromJson(jsonString);

import 'package:prspy/models/asset.dart';
import 'package:prspy/models/faction.dart';
import 'package:prspy/models/map_asset.dart';

///
///
///
class MapDetailDTO {
  String? mode;
  int? size;
  List<Faction>? teams;
  List<MapAsset>? team1Assets;
  List<MapAsset>? team2Assets;

  ///
  ///
  ///
  MapDetailDTO.fromJson(Map<String, dynamic> map) {
    teams = <Faction>[];
    team1Assets = <MapAsset>[];
    team2Assets = <MapAsset>[];
    for (dynamic faction in map['Team']) {
      teams!.add(Faction.fromJson(faction));
    }
    for (dynamic asset in map['Assets']) {
      String assetKey = asset['Key'];
      if (_checkIfAssetExists(assetKey)) {
        MapAsset mapAsset = MapAsset.fromJson(asset);
        _setAssetName(mapAsset);
        if (mapAsset.team == 1) {
          if (_checkIfSimilarAssetIsAlreadyAdded(team1Assets!, mapAsset)) {
            _updateAssetAmount(team1Assets!, mapAsset);
          } else {
            team1Assets!.add(mapAsset);
          }
        } else {
          if (_checkIfSimilarAssetIsAlreadyAdded(team2Assets!, mapAsset)) {
            _updateAssetAmount(team2Assets!, mapAsset);
          } else {
            team2Assets!.add(mapAsset);
          }
        }
      }
    }
  }

  ///
  ///
  ///
  bool _checkIfAssetExists(String assetKey) => Asset.defaultAssets
      .any((Asset element) => element.key.toLowerCase() == assetKey);

  ///
  ///
  ///
  void _setAssetName(MapAsset mapAsset) {
    Asset asset = Asset.defaultAssets.firstWhere((Asset element) =>
        element.key.toLowerCase() == mapAsset.key.toLowerCase());
    mapAsset.name = asset.name;
    mapAsset.icon = asset.icon;
  }

  ///
  ///
  ///
  bool _checkIfSimilarAssetIsAlreadyAdded(
    List<MapAsset> assets,
    MapAsset mapAsset,
  ) {
    return assets.any((MapAsset asset) =>
        asset.key == mapAsset.key &&
        asset.respawnDelay == mapAsset.respawnDelay &&
        asset.initialDelay == mapAsset.initialDelay);
  }

  ///
  ///
  ///
  void _updateAssetAmount(List<MapAsset> assets, MapAsset mapAsset) {
    assets
        .firstWhere((MapAsset asset) =>
            asset.key == mapAsset.key &&
            asset.respawnDelay == mapAsset.respawnDelay &&
            asset.initialDelay == mapAsset.initialDelay)
        .amount += 1;
  }
}
