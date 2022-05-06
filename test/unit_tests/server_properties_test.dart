import 'package:flutter_test/flutter_test.dart';
import 'package:prspy/models/server_properties.dart';

import '../test_jsons.dart';

///
///
///
void main() {
  ///
  ///
  ///
  test('Create a ServerProperties object from a json', () {
    ServerProperties properties =
        ServerProperties.fromJson(TestJsons.serverPropertiesJson);

    expect(properties.gamename, 'battlefield2');
    expect(properties.hostname, 'Server Name');
    expect(properties.gamever, '1.5.3153-802.0');
    expect(properties.map.name, 'Kashan Desert');
    expect(properties.map.gameType, 'gpm_cq');
    expect(properties.map.normalizedGameType, 'AAS');
    expect(properties.map.normalizedLayout, 'Std');
    expect(properties.map.normalizedMapName, 'kashandesert');
    expect(properties.gamevariant, 'pr');
    expect(properties.numplayers, 93);
    expect(properties.maxplayers, 100);
    expect(properties.password, 0);
    expect(properties.timelimit, 10800);
    expect(properties.roundtime, 1);
    expect(properties.operatingSystem, 'win32.png');
    expect(properties.battleRecordUrl, 'http://');
    expect(properties.sponsortext, 'Server Sponsor Text');
    expect(properties.sponsorlogoUrl, 'Server Banner');
    expect(properties.communitylogoUrl, 'Server community url');
    expect(properties.map.faction1.name, 'Middle Eastern Coalition');
    expect(properties.map.faction2.name, 'United States Army');
    expect(properties.map.size, 64);
    expect(properties.reservedSlots, 1);
  });
}
