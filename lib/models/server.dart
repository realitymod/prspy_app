import 'package:prspy/models/player.dart';
import 'package:prspy/models/server_properties.dart';

///
///
///
class Server {
  late String serverId;
  late bool hasMumble;
  late String countryFlag;
  late ServerProperties properties;
  late List<Player> players;

  ///
  ///
  ///
  Server();

  ///
  ///
  ///
  Server.fromJson(Map<String, dynamic> json) {
    serverId = json['serverId'];
    hasMumble = json['hasMumble'];
    countryFlag = json['countryFlag'];
    properties = ServerProperties.fromJson(json['properties']);
    players = <Player>[];
    for (Map<String, dynamic> playerData in json['players']) {
      players.add(Player.fromJson(playerData));
    }
  }
}
