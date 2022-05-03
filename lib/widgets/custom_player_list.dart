import 'package:flutter/material.dart';
import 'package:prspy/models/config.dart';
import 'package:prspy/models/friend.dart';
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
  final Config _config = Config();

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
              height: 0,
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
    ValueNotifier<bool> isFriendNotifier = ValueNotifier<bool>(
      _config.friends
          .any((Friend friend) => friend.nickname == player.playerName),
    );

    return ValueListenableBuilder<bool>(
      valueListenable: isFriendNotifier,
      builder: (BuildContext context, bool isFriend, Widget? child) {
        return ListTile(
          title: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(player.playerName),
          ),
          trailing: Wrap(
            children: <Widget>[
              SizedBox(
                width: 50,
                child: Text(
                  '${player.score}',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 43,
                child: Text(
                  '${player.kills}',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 43,
                child: Text(
                  '${player.deaths}',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  '${player.ping}',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          tileColor: isFriend ? Colors.blue.withOpacity(0.2) : null,
          onTap: () {
            if (isFriend) {
              _config.removeFriend(
                _config.friends.firstWhere(
                  (Friend element) => element.nickname == player.playerName,
                ),
              );

              isFriendNotifier.value = false;
            } else {
              _config.addFriend(player);
              isFriendNotifier.value = true;
            }
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(isFriend ? 'Friend Removed' : 'Friend added'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        );
      },
    );
  }
}
