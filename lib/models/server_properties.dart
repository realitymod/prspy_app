import 'package:prspy/models/map_detail.dart';

///
///
///
class ServerProperties {
  late String gamename;
  late String hostname;
  late String gamever;
  late String? serverVersion;
  late String gamevariant;
  late int numplayers;
  late int maxplayers;
  late int password;
  late int timelimit;
  late int roundtime;
  late String operatingSystem;
  late String battleRecordUrl;
  late String sponsortext;
  late String sponsorlogoUrl;
  late String communitylogoUrl;
  late String nextMap;
  late MapDetail map;
  late int reservedSlots;

  ///
  ///
  ///
  ServerProperties.fromJson(Map<String, dynamic> json) {
    gamename = json['gamename'];
    hostname = json['hostname'];
    gamever = json['gamever'];
    gamevariant = json['gamevariant'];
    numplayers = int.parse(json['numplayers']);
    maxplayers = int.parse(json['maxplayers']);
    password = int.parse(json['password']);
    timelimit = int.parse(json['timelimit']);
    roundtime = int.parse(json['roundtime'] ?? 1);
    operatingSystem = '${json['bf2_os']}.png';
    battleRecordUrl = json['bf2_d_dl'];
    sponsortext = json['bf2_sponsortext'];
    sponsorlogoUrl = json['bf2_sponsorlogo_url'];
    communitylogoUrl = json['bf2_communitylogo_url'];
    reservedSlots = int.parse(json['bf2_reservedslots']);
    map = MapDetail.fromJson(json);



    if(hostname.startsWith('[') && hostname.contains(']')){
      // Get the server version from hostname
      serverVersion = hostname.substring(4, hostname.indexOf(']'));
      // Remove the version from hostname
      hostname = hostname.substring(hostname.indexOf(']') + 1);
    } else {
      serverVersion = null;
    }


    _extractNextMapFromSponsorText();
    sponsortext = sponsortext.replaceAll('-', '').replaceAll('|', '\n').trim();
  }

  ///As there is no kind of pattern in the place where it indicates the next
  /// map, the method below checks if the string that was placed inside the next
  /// map is really a map by checking the layout
  void _extractNextMapFromSponsorText() {
    if (sponsortext.split('|').length > 0) {
      nextMap = sponsortext.split('|').last.trim().replaceAll('-', '');

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
