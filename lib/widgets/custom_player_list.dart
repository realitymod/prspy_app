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
    if (players.isEmpty) {
      return Center(child: Text('0 Players'));
    }
    return SingleChildScrollView(
      child: DataTable(
        columnSpacing: 25,
        showBottomBorder: true,
        headingRowColor: MaterialStateProperty.all(Colors.grey.shade800),
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

  ///
  ///
  ///
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
    // Add the footer row
    rows.add(
      DataRow(
        color: MaterialStateProperty.all(Colors.grey.shade800),
        cells: <DataCell>[
          DataCell(
            Text('${players.length} Players'),
          ),
          DataCell(
            Text(
              players
                  .fold(
                    0,
                    (int previousValue, Player element) =>
                        previousValue += element.score,
                  )
                  .toString(),
            ),
          ),
          DataCell(
            Text(
              players
                  .fold(
                    0,
                    (int previousValue, Player element) =>
                        previousValue += element.kills,
                  )
                  .toString(),
            ),
          ),
          DataCell(
            Text(
              players
                  .fold(
                    0,
                    (int previousValue, Player element) =>
                        previousValue += element.deaths,
                  )
                  .toString(),
            ),
          ),
          DataCell(
            Text(_calculateAveragePing().toInt().toString()),
          ),
        ],
      ),
    );
    return rows;
  }

  ///
  ///
  ///
  double _calculateAveragePing() {
    return players.map((Player m) => m.ping).reduce((int a, int b) => a + b) /
        players.length;
  }

  ///
  ///
  ///
  TextStyle get _headerTextStyle => TextStyle(fontWeight: FontWeight.bold);
}
