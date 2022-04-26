import 'package:flutter/material.dart';
import 'package:prspy/models/player.dart';

///
///
///
class CustomPlayerList extends StatelessWidget {
  final List<Player> players;

  ///
  ///
  ///
  const CustomPlayerList({required this.players, Key? key}) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columnSpacing: 25,
        border: TableBorder.symmetric(inside: BorderSide()),
        columns: <DataColumn>[
          DataColumn(
            label: Text(
              'Player Name',
              style: _headerTextStyle,
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'S',
                textAlign: TextAlign.center,
                style: _headerTextStyle,
              ),
            ),
            numeric: true,
            tooltip: 'Score',
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'K',
                style: _headerTextStyle,
              ),
            ),
            numeric: true,
            tooltip: 'Kills',
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'D',
                textAlign: TextAlign.center,
                style: _headerTextStyle,
              ),
            ),
            numeric: true,
            tooltip: 'Deaths',
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'P',
                textAlign: TextAlign.center,
                style: _headerTextStyle,
              ),
            ),
            numeric: true,
            tooltip: 'Ping',
          ),
        ],
        rows: _createPlayerRows(),
      ),
    );
  }

  List<DataRow> _createPlayerRows() {
    List<DataRow> rows = <DataRow>[];
    for (Player player in players) {
      rows.add(
        DataRow(
          cells: <DataCell>[
            DataCell(
              Text(player.name),
            ),
            DataCell(
              Text(
                player.score.toString(),
              ),
            ),
            DataCell(
              Text(
                player.kills.toString(),
              ),
            ),
            DataCell(
              Text(
                player.deaths.toString(),
              ),
            ),
            DataCell(
              Text(
                player.ping.toString(),
              ),
            ),
          ],
        ),
      );
    }
    return rows;
  }

  ///
  ///
  ///
  TextStyle get _headerTextStyle => TextStyle(fontWeight: FontWeight.bold);
}
