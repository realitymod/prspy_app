import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prspy/models/faction.dart';

///
///
///
void main() {
  ///
  ///
  ///
  setUpAll(TestWidgetsFlutterBinding.ensureInitialized);

  ///
  ///
  ///
  test('Create North Vietnamese Army Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'vnnva');
    expect(faction.name, 'North Vietnamese Army');
    expect(faction.code, 'vnnva');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test('Create United States Army Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'vnusa');
    expect(faction.name, 'United States Army');
    expect(faction.code, 'vnusa');
    expect(faction.flag, 'vnusa.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);

    Faction faction2 = Faction.fromCode(code: 'usa');
    expect(faction2.name, 'United States Army');
    expect(faction2.code, 'usa');
    expect(faction2.flag, 'usa.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag2 = await rootBundle.load(
      'assets/images/faction_flags/${faction2.flag}',
    );
    expect(flag2.lengthInBytes > 1, isTrue);

    Faction faction3 = Faction.fromCode(code: 'ww2usa');
    expect(faction3.name, 'United States Army');
    expect(faction3.code, 'ww2usa');
    expect(faction3.flag, 'ww2usa.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag3 = await rootBundle.load(
      'assets/images/faction_flags/${faction3.flag}',
    );
    expect(flag3.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test('Create Chinese Forces Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'ch');
    expect(faction.name, 'Chinese Forces');
    expect(faction.code, 'ch');
    expect(faction.flag, 'ch.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test('Create USMC Army Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'us');
    expect(faction.name, 'USMC');
    expect(faction.code, 'us');
    expect(faction.flag, 'us.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);

    Faction faction2 = Faction.fromCode(code: 'vnusmc');
    expect(faction2.name, 'USMC');
    expect(faction2.code, 'vnusmc');
    expect(faction2.flag, 'vnusmc.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag2 = await rootBundle.load(
      'assets/images/faction_flags/${faction2.flag}',
    );
    expect(flag2.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test('Create Russian Armed Forces Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'ru');
    expect(faction.name, 'Russian Armed Forces');
    expect(faction.code, 'ru');
    expect(faction.flag, 'ru.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test('Create Insurgents Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'meinsurgent');
    expect(faction.name, 'Insurgents');
    expect(faction.code, 'meinsurgent');
    expect(faction.flag, 'meinsurgent.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test('Create British Armed Forces Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'gb');
    expect(faction.name, 'British Armed Forces');
    expect(faction.code, 'gb');
    expect(faction.flag, 'gb.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);

    Faction faction2 = Faction.fromCode(code: 'gb82');
    expect(faction2.name, 'British Armed Forces');
    expect(faction2.code, 'gb82');
    expect(faction2.flag, 'gb82.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag2 = await rootBundle.load(
      'assets/images/faction_flags/${faction2.flag}',
    );
    expect(flag2.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test(
    'Create Middle Eastern Coalition Faction object using its code',
    () async {
      Faction faction = Faction.fromCode(code: 'mec');
      expect(faction.name, 'Middle Eastern Coalition');
      expect(faction.code, 'mec');
      expect(faction.flag, 'mec.png');

      // Checks if the faction image exists in the assets folder
      ByteData flag = await rootBundle.load(
        'assets/images/faction_flags/${faction.flag}',
      );
      expect(flag.lengthInBytes > 1, isTrue);
    },
  );

  ///
  ///
  ///
  test('Create Hamas Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'hamas');
    expect(faction.name, 'Hamas');
    expect(faction.code, 'hamas');
    expect(faction.flag, 'hamas.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test('Create Israeli Defence Force Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'idf');
    expect(faction.name, 'Israeli Defence Force');
    expect(faction.code, 'idf');
    expect(faction.flag, 'idf.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test('Create Dutch Armed Forces Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'nl');
    expect(faction.name, 'Dutch Armed Forces');
    expect(faction.code, 'nl');
    expect(faction.flag, 'nl.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test('Create Polish Armed Forces Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'pl');
    expect(faction.name, 'Polish Armed Forces');
    expect(faction.code, 'pl');
    expect(faction.flag, 'pl.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test('Create German Forces Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'ger');
    expect(faction.name, 'German Forces');
    expect(faction.code, 'ger');
    expect(faction.flag, 'ger.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test('Create Militia Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'chinsurgent');
    expect(faction.name, 'Militia');
    expect(faction.code, 'chinsurgent');
    expect(faction.flag, 'chinsurgent.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test('Create Canadian Forces Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'cf');
    expect(faction.name, 'Canadian Forces');
    expect(faction.code, 'cf');
    expect(faction.flag, 'cf.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test('Create Taliban Army Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'taliban');
    expect(faction.name, 'Taliban');
    expect(faction.code, 'taliban');
    expect(faction.flag, 'taliban.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test('Create Wehrmacht Army Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'ww2ger');
    expect(faction.name, 'Wehrmacht');
    expect(faction.code, 'ww2ger');
    expect(faction.flag, 'ww2ger.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test('Create Argentine Armed Forces Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'arg82');
    expect(faction.name, 'Argentine Armed Forces');
    expect(faction.code, 'arg82');
    expect(faction.flag, 'arg82.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test('Create Syrian Rebels Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'fsa');
    expect(faction.name, 'Syrian Rebels');
    expect(faction.code, 'fsa');
    expect(faction.flag, 'fsa.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test('Create French Forces Faction object using its code', () async {
    Faction faction = Faction.fromCode(code: 'fr');
    expect(faction.name, 'French Forces');
    expect(faction.code, 'fr');
    expect(faction.flag, 'fr.png');

    // Checks if the faction image exists in the assets folder
    ByteData flag = await rootBundle.load(
      'assets/images/faction_flags/${faction.flag}',
    );
    expect(flag.lengthInBytes > 1, isTrue);
  });

  ///
  ///
  ///
  test(
    'Create African Resistance Fighters Faction object using its code',
    () async {
      Faction faction = Faction.fromCode(code: 'arf');
      expect(faction.name, 'African Resistance Fighters');
      expect(faction.code, 'arf');
      expect(faction.flag, 'arf.png');

      // Checks if the faction image exists in the assets folder
      ByteData flag = await rootBundle.load(
        'assets/images/faction_flags/${faction.flag}',
      );
      expect(flag.lengthInBytes > 1, isTrue);
    },
  );

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
