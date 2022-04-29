///
///
///
class TestJsons {
  ///
  ///
  ///
  static Map<String, dynamic> get serverPropertiesJson {
    return <String, dynamic>{
      'gamename': 'battlefield2',
      'hostname': '[PR v1.7.1.1]Server Name',
      'gamever': '1.5.3153-802.0',
      'mapname': 'Kashan Desert',
      'gametype': 'gpm_cq',
      'gamevariant': 'pr',
      'numplayers': '93',
      'maxplayers': '100',
      'password': '0',
      'timelimit': '10800',
      'roundtime': '1',
      'bf2_os': 'win32',
      'bf2_d_dl': 'http://',
      'bf2_sponsortext': 'Server Sponsor Text',
      'bf2_sponsorlogo_url': 'Server Banner',
      'bf2_communitylogo_url': 'Server community url',
      'bf2_team1': 'MEC',
      'bf2_team2': 'USA',
      'bf2_mapsize': '64',
      'bf2_reservedslots': '1',
    };
  }

  ///
  ///
  ///
  static Map<String, dynamic> get serverJson {
    return <String, dynamic>{
      'serverId': '123456',
      'hasMumble': true,
      'countryFlag': 'BR',
      'properties': serverPropertiesJson,
      'players': playersJson,
    };
  }

  ///
  ///
  ///
  static List<Map<String, dynamic>> get playersJson {
    return <Map<String, dynamic>>[
      <String, dynamic>{
        'name': 'Player 1',
        'score': 379,
        'kills': 0,
        'deaths': 0,
        'team': 2,
        'ping': 51,
        'isAI': 0,
      },
      <String, dynamic>{
        'name': 'Player 2',
        'score': 184,
        'kills': 0,
        'deaths': 2,
        'team': 1,
        'ping': 28,
        'isAI': 0,
      },
      <String, dynamic>{
        'name': 'Player 3',
        'score': 0,
        'kills': 0,
        'deaths': 0,
        'team': 1,
        'ping': 44,
        'isAI': 0,
      },
      <String, dynamic>{
        'name': 'Player 4',
        'score': 65,
        'kills': 1,
        'deaths': 4,
        'team': 2,
        'ping': 52,
        'isAI': 0,
      },
    ];
  }
}
