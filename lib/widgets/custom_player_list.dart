import 'package:flutter/material.dart';
import 'package:prspy/models/player.dart';

///
///
///
class CustomPlayerList extends StatefulWidget {
  final List<Player> players;

  ///
  ///
  ///
  const CustomPlayerList({required this.players, Key? key}) : super(key: key);

  ///
  ///
  ///
  @override
  State<CustomPlayerList> createState() => _CustomPlayerListState();
}

///
///
///
class _CustomPlayerListState extends State<CustomPlayerList>
    with AutomaticKeepAliveClientMixin {
  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('Building list');
    if (widget.players.isEmpty) {
      return const Center(child: Text('0 Players'));
    }
    return Column(
      children: <Widget>[
        _playerListTileHeader(),
        Expanded(
          child: ListView.separated(
            itemCount: widget.players.length + 1,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              color: Colors.white,
            ),
            itemBuilder: (BuildContext context, int index) {
              if (index == widget.players.length) {
                return _playerListTileFooter();
              } else {
                return _playerListTile(widget.players.elementAt(index));
              }
            },
          ),
        ),
      ],
    );
  }

  ///
  ///
  ///
  double _calculateAveragePing() {
    return widget.players
            .map((Player m) => m.ping)
            .reduce((int a, int b) => a + b) /
        widget.players.length;
  }

  ///
  ///
  ///
  int get _calculateTotalScore {
    return widget.players.fold(
      0,
      (int previousValue, Player element) => previousValue += element.score,
    );
  }

  ///
  ///
  ///
  int get _calculateTotalKills {
    return widget.players.fold(
      0,
      (int previousValue, Player element) => previousValue += element.kills,
    );
  }

  ///
  ///
  ///
  int get _calculateTotalDeaths {
    return widget.players.fold(
      0,
      (int previousValue, Player element) => previousValue += element.deaths,
    );
  }

  ///
  ///
  ///
  @override
  bool get wantKeepAlive => true;

  ///
  ///
  ///
  Widget _playerListTileHeader() {
    return ListTile(
      title: const SelectableText('Player name'),
      trailing: Wrap(
        children: const <Widget>[
          SizedBox(
            width: 50,
            child: SelectableText('Score'),
          ),
          SizedBox(
            width: 43,
            child: SelectableText('Kills'),
          ),
          SizedBox(
            width: 50,
            child: SelectableText('Deaths'),
          ),
          SizedBox(
            width: 50,
            child: SelectableText('Ping'),
          ),
        ],
      ),
    );
  }

  ///
  ///
  ///
  Widget _playerListTile(Player player) {
    return ListTile(
      title: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: SelectableText(player.playerName),
      ),
      trailing: Wrap(
        children: <Widget>[
          SizedBox(
            width: 50,
            child: SelectableText(
              '${player.score}',
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            width: 43,
            child: SelectableText(
              '${player.kills}',
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            width: 43,
            child: SelectableText(
              '${player.deaths}',
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            width: 50,
            child: SelectableText(
              '${player.ping}',
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  ///
  ///
  ///
  Widget _playerListTileFooter() {
    return ListTile(
      title: SelectableText('Players: ${widget.players.length}'),
      trailing: Wrap(
        children: <Widget>[
          SizedBox(
            width: 60,
            child: SelectableText(_calculateTotalScore.toString()),
          ),
          SizedBox(
            width: 43,
            child: SelectableText(_calculateTotalKills.toString()),
          ),
          SizedBox(
            width: 50,
            child: SelectableText(_calculateTotalDeaths.toString()),
          ),
          SizedBox(
            width: 50,
            child: SelectableText(
              _calculateAveragePing().toInt().toString(),
            ),
          ),
        ],
      ),
    );
  }
}
