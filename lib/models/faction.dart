///
///
///
class Faction {
  String name;
  String code;
  int? tickets;
  String? flag;

  ///
  ///
  ///
  Faction({required this.code, required this.name}) {
    flag = '$code.png';
  }

  ///
  ///
  ///
  factory Faction.fromJson(Map<String, dynamic> map) {
    Faction faction = Faction.fromCode(code: map['Code']);
    faction.tickets = map['Tickets'];
    return faction;
  }

  ///
  ///
  ///
  factory Faction.fromCode({required String code}) {
    code = code.toLowerCase();
    const Map<String, String> factionMap = <String, String>{
      'vnnva': 'North Vietnamese Army',
      'vnusa': 'United States Army',
      'usa': 'United States Army',
      'ww2usa': 'United States Army',
      'ch': 'Chinese Forces',
      'us': 'USMC',
      'vnusmc': 'USMC',
      'ru': 'Russian Armed Forces',
      'ru90': 'Russian Armed Forces',
      'meinsurgent': 'Insurgents',
      'gb': 'British Armed Forces',
      'gb82': 'British Armed Forces',
      'mec': 'Middle Eastern Coalition',
      'hamas': 'Hamas',
      'idf': 'Israeli Defence Force',
      'nl': 'Dutch Armed Forces',
      'pl': 'Polish Armed Forces',
      'ger': 'German Forces',
      'chinsurgent': 'Militia',
      'chinsurgent90': 'Militia',
      'cf': 'Canadian Forces',
      'taliban': 'Taliban',
      'ww2ger': 'Wehrmacht',
      'ww2ger41': 'Wehrmacht',
      'arg82': 'Argentine Armed Forces',
      'fsa': 'Syrian Rebels',
      'fr': 'French Forces',
      'arf': 'African Resistance Fighters',
      'ww2rusearly': 'Red Army',
      'ww2rus': 'Red Army',
      'chechen90': 'Chechnya',
    };
    final String name = factionMap[code] ?? 'Unknown Faction';
    return Faction(code: code, name: name);
  }

  ///
  ///
  ///
  String get flagAsset => 'assets/images/faction_flags/$flag';
}
