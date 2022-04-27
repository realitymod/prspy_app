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
  Faction({required this.code, required this.name});

  ///
  ///
  ///
  factory Faction.fromCode({required String code}) {
    code = code.toLowerCase();
    late Faction team;
    if (code == 'vnnva') {
      team = Faction(code: code, name: 'North Vietnamese Army');
    } else if (code == 'vnusa' || code == 'usa' || code == 'ww2usa') {
      team = Faction(code: code, name: 'United States Army');
    } else if (code == 'ch') {
      team = Faction(code: code, name: 'Chinese Forces');
    } else if (code == 'us' || code == 'vnusmc') {
      team = Faction(code: code, name: 'USMC');
    } else if (code == 'ru') {
      team = Faction(code: code, name: 'Russian Armed Forces');
    } else if (code == 'meinsurgent') {
      team = Faction(code: code, name: 'Insurgents');
    } else if (code == 'gb' || code == 'gb82') {
      team = Faction(code: code, name: 'British Armed Forces');
    } else if (code == 'mec') {
      team = Faction(code: code, name: 'Middle Eastern Coalition');
    } else if (code == 'hamas') {
      team = Faction(code: code, name: 'Hamas');
    } else if (code == 'idf') {
      team = Faction(code: code, name: 'Israeli Defence Force');
    } else if (code == 'nl') {
      team = Faction(code: code, name: 'Dutch Armed Forces');
    } else if (code == 'pl') {
      team = Faction(code: code, name: 'Polish Armed Forces');
    } else if (code == 'ger') {
      team = Faction(code: code, name: 'German Forces');
    } else if (code == 'chinsurgent') {
      team = Faction(code: code, name: 'Militia');
    } else if (code == 'cf') {
      team = Faction(code: code, name: 'Canadian Forces');
    } else if (code == 'taliban') {
      team = Faction(code: code, name: 'Taliban');
    } else if (code == 'ww2ger') {
      team = Faction(code: code, name: 'Wehrmacht');
    } else if (code == 'arg82') {
      team = Faction(code: code, name: 'Argentine Armed Forces');
    } else if (code == 'fsa') {
      team = Faction(code: code, name: 'Syrian Rebels');
    } else if (code == 'fr') {
      team = Faction(code: code, name: 'French Forces');
    } else {
      team = Faction(code: code, name: 'Unknown Faction');
    }
    return team;
  }
}
