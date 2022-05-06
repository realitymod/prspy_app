import 'package:prspy/models/faction.dart';
import 'package:prspy/models/map_asset.dart';

///
///
///
class MapDetail {
  late String name;
  late int size;
  late Faction faction1;
  late Faction faction2;
  late String gameType;
  late String mapOverviewUrl;
  late String mapGaleryUrl;
  MapAsset? assets;

  ///
  ///
  ///
  MapDetail();

  ///
  ///
  ///
  MapDetail.fromJson(Map<String, dynamic> map) {
    name = map['mapname'];
    size = int.parse(map['bf2_mapsize']);
    faction1 = Faction.fromCode(code: map['bf2_team1']);
    faction2 = Faction.fromCode(code: map['bf2_team2']);
    gameType = map['gametype'];
    _setMapGalleryUrls();
  }

  ///
  ///
  ///
  void _setMapGalleryUrls() {
    // Create url for displaying map image in server detail drawer
    mapOverviewUrl = 'https://www.realitymod.com/mapgallery/images/maps/'
        '$normalizedMapName/mapoverview_${gameType}_${size}.jpg';
    // Create url to map gallery
    mapGaleryUrl =
        'https://www.realitymod.com/mapgallery/#!/$normalizedMapName/$gameType/$size';
  }

  ///
  ///
  ///
  String get normalizedMapName => name.toLowerCase().replaceAll(' ', '').trim();

  /// 16 = Infantary
  /// 32 = Alternative
  /// 64 = Standard
  /// 128 = Large
  String get normalizedLayout {
    if (size == 16) {
      return 'Inf';
    } else if (size == 32) {
      return 'Alt';
    } else if (size == 64) {
      return 'Std';
    } else {
      return 'Lrg';
    }
  }

  ///
  ///
  ///
  String get normalizedGameType {
    String gameType = this.gameType.split('_').last.toLowerCase();

    if (gameType == 'coop') {
      gameType = 'Co-Op';
    } else if (gameType == 'cq') {
      gameType = 'AAS';
    }
    // Capitalize the first letter of the gametype
    return '${gameType.substring(0, 1).toUpperCase()}${gameType.substring(1, gameType.length)}';
  }
}
