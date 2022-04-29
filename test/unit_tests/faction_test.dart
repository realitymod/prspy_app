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
    expect(faction.flag, 'vnusa.png');

    Faction faction2 = Faction.fromCode(code: 'usa');
    expect(faction2.name, 'United States Army');
    expect(faction2.code, 'usa');
    expect(faction2.flag, 'usa.png');

    Faction faction3 = Faction.fromCode(code: 'ww2usa');
    expect(faction3.name, 'United States Army');
    expect(faction3.code, 'ww2usa');
    expect(faction3.flag, 'ww2usa.png');
  });

  ///
  ///
  ///
  test('Create Chinese Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'ch');
    expect(faction.name, 'Chinese Forces');
    expect(faction.code, 'ch');
    expect(faction.flag, 'ch.png');
  });

  ///
  ///
  ///
  test('Create USMC Army Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'us');
    expect(faction.name, 'USMC');
    expect(faction.code, 'us');
    expect(faction.flag, 'us.png');

    Faction faction2 = Faction.fromCode(code: 'vnusmc');
    expect(faction2.name, 'USMC');
    expect(faction2.code, 'vnusmc');
    expect(faction2.flag, 'vnusmc.png');
  });

  ///
  ///
  ///
  test('Create Russian Armed Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'ru');
    expect(faction.name, 'Russian Armed Forces');
    expect(faction.code, 'ru');
    expect(faction.flag, 'ru.png');
  });

  ///
  ///
  ///
  test('Create Insurgents Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'meinsurgent');
    expect(faction.name, 'Insurgents');
    expect(faction.code, 'meinsurgent');
    expect(faction.flag, 'meinsurgent.png');
  });

  ///
  ///
  ///
  test('Create British Armed Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'gb');
    expect(faction.name, 'British Armed Forces');
    expect(faction.code, 'gb');
    expect(faction.flag, 'gb.png');

    Faction faction2 = Faction.fromCode(code: 'gb82');
    expect(faction2.name, 'British Armed Forces');
    expect(faction2.code, 'gb82');
    expect(faction2.flag, 'gb82.png');
  });

  ///
  ///
  ///
  test('Create Middle Eastern Coalition Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'mec');
    expect(faction.name, 'Middle Eastern Coalition');
    expect(faction.code, 'mec');
    expect(faction.flag, 'mec.png');
  });

  ///
  ///
  ///
  test('Create Hamas Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'hamas');
    expect(faction.name, 'Hamas');
    expect(faction.code, 'hamas');
    expect(faction.flag, 'hamas.png');
  });

  ///
  ///
  ///
  test('Create Israeli Defence Force Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'idf');
    expect(faction.name, 'Israeli Defence Force');
    expect(faction.code, 'idf');
    expect(faction.flag, 'idf.png');
  });

  ///
  ///
  ///
  test('Create Dutch Armed Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'nl');
    expect(faction.name, 'Dutch Armed Forces');
    expect(faction.code, 'nl');
    expect(faction.flag, 'nl.png');
  });

  ///
  ///
  ///
  test('Create Polish Armed Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'pl');
    expect(faction.name, 'Polish Armed Forces');
    expect(faction.code, 'pl');
    expect(faction.flag, 'pl.png');
  });

  ///
  ///
  ///
  test('Create German Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'ger');
    expect(faction.name, 'German Forces');
    expect(faction.code, 'ger');
    expect(faction.flag, 'ger.png');
  });

  ///
  ///
  ///
  test('Create Militia Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'chinsurgent');
    expect(faction.name, 'Militia');
    expect(faction.code, 'chinsurgent');
    expect(faction.flag, 'chinsurgent.png');
  });

  ///
  ///
  ///
  test('Create Canadian Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'cf');
    expect(faction.name, 'Canadian Forces');
    expect(faction.code, 'cf');
    expect(faction.flag, 'cf.png');
  });

  ///
  ///
  ///
  test('Create Taliban Army Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'taliban');
    expect(faction.name, 'Taliban');
    expect(faction.code, 'taliban');
    expect(faction.flag, 'taliban.png');
  });

  ///
  ///
  ///
  test('Create Wehrmacht Army Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'ww2ger');
    expect(faction.name, 'Wehrmacht');
    expect(faction.code, 'ww2ger');
    expect(faction.flag, 'ww2ger.png');
  });

  ///
  ///
  ///
  test('Create Argentine Armed Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'arg82');
    expect(faction.name, 'Argentine Armed Forces');
    expect(faction.code, 'arg82');
    expect(faction.flag, 'arg82.png');
  });

  ///
  ///
  ///
  test('Create Syrian Rebels Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'fsa');
    expect(faction.name, 'Syrian Rebels');
    expect(faction.code, 'fsa');
    expect(faction.flag, 'fsa.png');
  });

  ///
  ///
  ///
  test('Create French Forces Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'fr');
    expect(faction.name, 'French Forces');
    expect(faction.code, 'fr');
    expect(faction.flag, 'fr.png');
  });

  ///
  ///
  ///
  test('Create African Resistance Fighters Faction object using its code', () {
    Faction faction = Faction.fromCode(code: 'arf');
    expect(faction.name, 'African Resistance Fighters');
    expect(faction.code, 'arf');
    expect(faction.flag, 'arf.png');
  });

  ///
  ///
  ///
  test('Create Unknown Faction Faction object using its code', () {
    Faction faction = Faction.fromCode(code: '');
    expect(faction.name, 'Unknown Faction');
    expect(faction.code, '');
    expect(faction.flag, '.png');
  });
}
