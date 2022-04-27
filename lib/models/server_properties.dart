import 'package:prspy/models/faction.dart';

///
///
///
class ServerProperties {
  String? gamename;
  String hostname = '';
  String? gamever;
  String? mapname;
  String? gametype;
  String? gamevariant;
  String? numplayers;
  String? maxplayers;
  String? password;
  String? timelimit;
  String? roundtime;
  String? bf2Os;
  String? bf2DDl;
  String? bf2Sponsortext;
  String? bf2SponsorlogoUrl;
  String? bf2CommunitylogoUrl;
  Faction? faction1;
  Faction? faction2;

  /// 16 = Infantary
  /// 32 = Alternative
  /// 64 = Standard
  /// 128 = Large
  String? bf2Mapsize;
  String? bf2Reservedslots;

  ///
  ///
  ///
  ServerProperties.fromJson(Map<String, dynamic> json) {
    gamename = json['gamename'];
    hostname = json['hostname'];
    gamever = json['gamever'];
    mapname = json['mapname'];
    gametype = json['gametype'];
    gamevariant = json['gamevariant'];
    numplayers = json['numplayers'];
    maxplayers = json['maxplayers'];
    password = json['password'];
    timelimit = json['timelimit'];
    roundtime = json['roundtime'];
    bf2Os = json['bf2_os'];
    bf2DDl = json['bf2_d_dl'];
    bf2Sponsortext = json['bf2_sponsortext'];
    bf2SponsorlogoUrl = json['bf2_sponsorlogo_url'];
    bf2CommunitylogoUrl = json['bf2_communitylogo_url'];
    faction1 = Faction.fromCode(code: json['bf2_team1']);
    faction2 = Faction.fromCode(code: json['bf2_team2']);
    bf2Mapsize = json['bf2_mapsize'];
    bf2Reservedslots = json['bf2_reservedslots'];

    gametype = gametype!.split('_').last.toLowerCase();

    if (gametype == 'coop') {
      gametype = 'Co-Op';
    } else if (gametype == 'cq') {
      gametype = 'AAS';
    }

    // Capitalize the first letter of the gametype
    gametype =
        '${gametype!.substring(0, 1).toUpperCase()}${gametype!.substring(1, gametype!.length)}';

    // Remove the version tag from the begining of the hostname
    hostname = hostname.substring(13);

    // Set the correct layout based on map size
    if (bf2Mapsize == '16') {
      bf2Mapsize = 'Inf';
    } else if (bf2Mapsize == '32') {
      bf2Mapsize = 'Alt';
    } else if (bf2Mapsize == '64') {
      bf2Mapsize = 'Std';
    } else if (bf2Mapsize == '128') {
      bf2Mapsize = 'Lrg';
    }
  }
}
