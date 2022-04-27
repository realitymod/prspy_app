import 'package:prspy/models/map_model.dart';

///
///
///
class ServerProperties {
  late String gamename;
  late String hostname;
  late String gamever;
  late String gamevariant;
  late String numplayers;
  late String maxplayers;
  late String password;
  late String timelimit;
  late String roundtime;
  late String bf2Os;
  late String bf2DDl;
  late String bf2Sponsortext;
  late String bf2SponsorlogoUrl;
  late String bf2CommunitylogoUrl;
  late String nextMap;
  late MapModel map;
  late String bf2Reservedslots;

  ///
  ///
  ///
  ServerProperties.fromJson(Map<String, dynamic> json) {
    gamename = json['gamename'];
    hostname = json['hostname'];
    gamever = json['gamever'];
    gamevariant = json['gamevariant'];
    numplayers = json['numplayers'];
    maxplayers = json['maxplayers'];
    password = json['password'];
    timelimit = json['timelimit'];
    roundtime = json['roundtime'];
    bf2Os = '${json['bf2_os']}.png';
    bf2DDl = json['bf2_d_dl'];
    bf2Sponsortext = json['bf2_sponsortext'];
    bf2SponsorlogoUrl = json['bf2_sponsorlogo_url'];
    bf2CommunitylogoUrl = json['bf2_communitylogo_url'];
    bf2Reservedslots = json['bf2_reservedslots'];
    map = MapModel.fromJson(json);

    // Remove the version tag from the begining of the hostname
    hostname = hostname.substring(13);
    if (bf2Sponsortext.split('|').length > 0) {
      nextMap = bf2Sponsortext.split('|').last.trim().replaceAll('-', '');

      ///As there is no kind of pattern in the place where it indicates the next
      ///map, the if below checks if the string that was placed inside the next
      /// map is really a map by checking the layout
      if (!nextMap.contains('Std') &&
          !nextMap.contains('Alt') &&
          !nextMap.contains('Inf') &&
          !nextMap.contains('Lrg')) {
        nextMap = '';
      }

      ///I noticed that one of the servers put the name of the next map along
      ///with a text indicating what the next map is, the line below corrects that.
      nextMap = nextMap.replaceAll('Next map:', '').trim();
    }
  }
}
