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
  String? bf2Team1;
  String? bf2Team2;
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
    bf2Team1 = json['bf2_team1'];
    bf2Team2 = json['bf2_team2'];
    bf2Mapsize = json['bf2_mapsize'];
    bf2Reservedslots = json['bf2_reservedslots'];
    gametype = gametype!.split('_').last.toLowerCase();
    if (gametype == 'coop') {
      gametype = 'Co-Operative';
    } else if (gametype == 'cq') {
      gametype = 'AAS';
    }
  }
}
