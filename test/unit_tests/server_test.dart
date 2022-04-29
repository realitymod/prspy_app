import 'package:flutter_test/flutter_test.dart';
import 'package:prspy/models/server.dart';

import '../test_jsons.dart';

///
///
///
void main() {
  ///
  ///
  ///
  test('Create a Server object from json', () {
    Server server = Server.fromJson(TestJsons.serverJson);

    expect(server.serverId, '123456');
    expect(server.hasMumble, true);
    expect(server.countryFlag, 'BR');
    expect(server.properties.maxplayers, 100);
    expect(server.players.length, 4);

  });
}
