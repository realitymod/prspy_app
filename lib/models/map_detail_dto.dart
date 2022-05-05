// To parse this JSON data, do
//
//     final mapGallery = mapGalleryFromJson(jsonString);

import 'package:prspy/models/faction.dart';
import 'package:prspy/models/map_asset.dart';

class MapDetailDTO {
  MapDetailDTO({
    this.mode,
    this.size,
    this.teams,
    this.assets,
  });

  String? mode;
  int? size;
  List<Faction>? teams;
  List<MapAsset>? assets;

  ///
  ///
  ///
  MapDetailDTO.fromJson(Map<String, dynamic> map) {
    teams = <Faction>[];
    assets = <MapAsset>[];
    for (dynamic faction in map['Teams']) {
      teams!.add(Faction.fromJson(faction));
    }
    for (dynamic asset in map['Assets']) {
      assets!.add(MapAsset.fromJson(asset));
    }
  }
}
