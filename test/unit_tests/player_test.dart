import 'package:flutter_test/flutter_test.dart';
import 'package:prspy/models/player.dart';

import '../test_jsons.dart';

///
///
///
void main() {
  ///
  ///
  ///
  test('Create a Player object from json', () {
    Player player = Player.fromJson(TestJsons.playersJson.first);

    expect(player.name, 'Player 1');
    expect(player.score, 379);
    expect(player.kills, 0);
    expect(player.deaths, 0);
    expect(player.team, 2);
    expect(player.ping, 51);
    expect(player.isAi, false);
  });
}
