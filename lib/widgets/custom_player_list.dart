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
            itemCount: widget.players.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              color: Colors.white,
            ),
            itemBuilder: (BuildContext context, int index) {
              return _playerListTile(widget.players.elementAt(index));
            },
          ),
        ),
      ],
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
            child: SelectableText(
              'Score',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 43,
            child: SelectableText(
              'Kills',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 50,
            child: SelectableText(
              'Deaths',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 50,
            child: SelectableText(
              'Ping',
              textAlign: TextAlign.center,
            ),
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
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 43,
            child: SelectableText(
              '${player.kills}',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 43,
            child: SelectableText(
              '${player.deaths}',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 50,
            child: SelectableText(
              '${player.ping}',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
