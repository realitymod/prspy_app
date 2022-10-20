import 'package:flutter/material.dart';
import 'package:prspy/enums/team.dart';
import 'package:prspy/models/config.dart';
import 'package:prspy/models/faction.dart';

///
///
///
class CustomTeamTab extends StatelessWidget {
  final Faction faction;
  final int? totalPlayers;
  final Team team;

  ///
  ///
  ///
  const CustomTeamTab({
    required this.faction,
    required this.team,
    this.totalPlayers,
    Key? key,
  }) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext p0, BoxConstraints p1) {
        return Container(
          color: team == Team.bluefor ? Config().blueforColor : Config().opforColor,
          height: 60,
          width: p1.maxWidth,
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
                style: TextStyle(
                  color: team == Team.opfor ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (totalPlayers != null && totalPlayers! > 0)
                Text(
                  'Players: $totalPlayers',
                  style: TextStyle(color: team == Team.opfor ? Colors.white : Colors.black),
                ),
              if (faction.tickets != null)
                Text(
                  '${faction.tickets} Tickets',
                  style: TextStyle(color: team == Team.opfor ? Colors.white : Colors.black),
                ),
            ],
          ),
        );
      },
    );
  }
}
