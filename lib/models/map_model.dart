import 'package:prspy/models/faction.dart';

///
///
///
class MapModel {
  late String name;
  late int size;
  late String layout;
  late Faction faction1;
  late Faction faction2;
  late String gameType;

  ///
  ///
  ///
  MapModel();

  ///
  ///
  ///
  MapModel.fromJson(Map<String, dynamic> map) {
    name = map['mapname'];
    size = int.parse(map['bf2_mapsize']);
    faction1 = Faction.fromCode(code: map['bf2_team1']);
    faction2 = Faction.fromCode(code: map['bf2_team2']);
    gameType = map['gametype'];
    _setCorrectLayout();
    _setCorrectGameType();
  }

  /// 16 = Infantary
  /// 32 = Alternative
  /// 64 = Standard
  /// 128 = Large
  void _setCorrectLayout() {
    // Set the correct layout based on map size
    if (size == 16) {
      layout = 'Inf';
    } else if (size == 32) {
      layout = 'Alt';
    } else if (size == 64) {
      layout = 'Std';
    } else if (size == 128) {
      layout = 'Lrg';
    }
  }

  ///
  ///
  ///
  void _setCorrectGameType() {
    gameType = gameType.split('_').last.toLowerCase();

    if (gameType == 'coop') {
      gameType = 'Co-Op';
    } else if (gameType == 'cq') {
      gameType = 'AAS';
    }
    // Capitalize the first letter of the gametype
    gameType =
        '${gameType.substring(0, 1).toUpperCase()}${gameType.substring(1, gameType.length)}';
  }
}
