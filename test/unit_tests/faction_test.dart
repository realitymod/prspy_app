import 'package:flutter_test/flutter_test.dart';
import 'package:prspy/models/faction.dart';

///
///
///
void main() {
  ///
  ///
  ///
  test('Create North Vietnamese Army Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'vnnva');
    expect(faction.name, 'North Vietnamese Army');
    expect(faction.code, 'vnnva');
  });

  ///
  ///
  ///
  test('Create United States Army Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'vnusa');
    expect(faction.name, 'United States Army');
    expect(faction.code, 'vnusa');

    Faction faction2 = Faction.fromCode(code: 'usa');
    expect(faction2.name, 'United States Army');
    expect(faction2.code, 'usa');

    Faction faction3 = Faction.fromCode(code: 'ww2usa');
    expect(faction3.name, 'United States Army');
    expect(faction3.code, 'ww2usa');
  });

  ///
  ///
  ///
  test('Create Chinese Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'ch');
    expect(faction.name, 'Chinese Forces');
    expect(faction.code, 'ch');
  });

  ///
  ///
  ///
  test('Create USMC Army Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'us');
    expect(faction.name, 'USMC');
    expect(faction.code, 'us');

    Faction faction2 = Faction.fromCode(code: 'vnusmc');
    expect(faction2.name, 'USMC');
    expect(faction2.code, 'vnusmc');
  });

  ///
  ///
  ///
  test('Create Russian Armed Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'ru');
    expect(faction.name, 'Russian Armed Forces');
    expect(faction.code, 'ru');
  });

  ///
  ///
  ///
  test('Create Insurgents Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'meinsurgent');
    expect(faction.name, 'Insurgents');
    expect(faction.code, 'meinsurgent');
  });

  ///
  ///
  ///
  test('Create British Armed Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'gb');
    expect(faction.name, 'British Armed Forces');
    expect(faction.code, 'gb');

    Faction faction2 = Faction.fromCode(code: 'gb82');
    expect(faction2.name, 'British Armed Forces');
    expect(faction2.code, 'gb82');
  });

  ///
  ///
  ///
  test('Create Middle Eastern Coalition Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'mec');
    expect(faction.name, 'Middle Eastern Coalition');
    expect(faction.code, 'mec');
  });

  ///
  ///
  ///
  test('Create Hamas Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'hamas');
    expect(faction.name, 'Hamas');
    expect(faction.code, 'hamas');
  });

  ///
  ///
  ///
  test('Create Israeli Defence Force Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'idf');
    expect(faction.name, 'Israeli Defence Force');
    expect(faction.code, 'idf');
  });

  ///
  ///
  ///
  test('Create Dutch Armed Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'nl');
    expect(faction.name, 'Dutch Armed Forces');
    expect(faction.code, 'nl');
  });

  ///
  ///
  ///
  test('Create Polish Armed Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'pl');
    expect(faction.name, 'Polish Armed Forces');
    expect(faction.code, 'pl');
  });

  ///
  ///
  ///
  test('Create German Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'ger');
    expect(faction.name, 'German Forces');
    expect(faction.code, 'ger');
  });

  ///
  ///
  ///
  test('Create Militia Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'chinsurgent');
    expect(faction.name, 'Militia');
    expect(faction.code, 'chinsurgent');
  });

  ///
  ///
  ///
  test('Create Canadian Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'cf');
    expect(faction.name, 'Canadian Forces');
    expect(faction.code, 'cf');
  });

  ///
  ///
  ///
  test('Create Taliban Army Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'taliban');
    expect(faction.name, 'Taliban');
    expect(faction.code, 'taliban');
  });

  ///
  ///
  ///
  test('Create Wehrmacht Army Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'ww2ger');
    expect(faction.name, 'Wehrmacht');
    expect(faction.code, 'ww2ger');
  });

  ///
  ///
  ///
  test('Create Argentine Armed Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'arg82');
    expect(faction.name, 'Argentine Armed Forces');
    expect(faction.code, 'arg82');
  });

  ///
  ///
  ///
  test('Create Syrian Rebels Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'fsa');
    expect(faction.name, 'Syrian Rebels');
    expect(faction.code, 'fsa');
  });

  ///
  ///
  ///
  test('Create French Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'fr');
    expect(faction.name, 'French Forces');
    expect(faction.code, 'fr');
  });

  ///
  ///
  ///
  test('Create Unknown Faction Faction object using its code', () {
    Faction faction = Faction.fromCode(code: '');
    expect(faction.name, 'Unknown Faction');
    expect(faction.code, '');
  });
}
