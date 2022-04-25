// To parse this JSON data, do
//
//     final server = serverFromJson(jsonString);

import 'package:prspy/models/player.dart';
import 'package:prspy/models/server_properties.dart';

class Server {
  String? serverId;
  bool? hasMumble;
  String? countryFlag;
  Properties? properties;
  List<Player> players = <Player>[];

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
    properties = Properties.fromJson(json['properties']);
    for (dynamic player in json['players']) {
      players.add(Player.fromJson(player));
    }
  }
}
