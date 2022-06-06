import 'package:flutter/material.dart';
import 'package:prspy/models/faction.dart';
import 'package:prspy/models/player.dart';

///
///
///
class CustomTeamTab extends StatelessWidget {
  final Faction faction;
  final List<Player>? players;

  ///
  ///
  ///
  const CustomTeamTab({
    required this.faction,
    this.players,
    Key? key,
  }) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            faction.flagAsset,
            width: 25,
          ),
          Text(
            faction.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
          if (players != null)
            Text(
              'Players: ${players!.length}',
            ),
          if (faction.tickets != null) Text('${faction.tickets} Tickets'),
        ],
      ),
    );
  }
}
