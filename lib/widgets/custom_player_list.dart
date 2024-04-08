import 'package:flutter/material.dart';
import 'package:prspy/models/config.dart';
import 'package:prspy/models/friend.dart';
import 'package:prspy/models/player.dart';
import 'package:prspy/widgets/custom_player_detail_modal.dart';
import 'package:url_launcher/url_launcher_string.dart';

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

  late int _totalScore;
  late int _totalKills;
  late int _totalDeaths;

  @override
  void initState() {
    _totalDeaths = _sumDeaths;
    _totalKills = _sumKills;
    _totalScore = _sumScores;
    super.initState();
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.players.isEmpty) {
      return const Center(child: Text('0 Players'));
    }
    widget.players.sort(
      (Player a, Player b) => b.score.compareTo(a.score),
    );
    return Column(
      children: <Widget>[
        _playerListTileHeader(),
        Expanded(
          child: ListView.separated(
            itemCount: widget.players.length + 1,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              color: Colors.white,
              height: 0,
            ),
            itemBuilder: (BuildContext context, int index) {
              if (index < widget.players.length) {
                return _playerListTile(widget.players.elementAt(index));
              }
              return _totalTeamScore();
            },
          ),
        ),
      ],
    );
  }

  ///
  ///
  ///
  ListTile _totalTeamScore() {
    return ListTile(
      title: const Text('Total Score'),
      trailing: Wrap(
        children: <Widget>[
          SizedBox(
            width: 50,
            child: Text(
              _totalScore.toString(),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 43,
            child: Text(
              _totalKills.toString(),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 43,
            child: Text(
              _totalDeaths.toString(),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }

  ///
  ///
  ///
  int get _sumScores => widget.players.fold(
        0,
        (int previousValue, Player element) => previousValue += element.score,
      );

  ///
  ///
  ///
  int get _sumKills => widget.players.fold(
        0,
        (int previousValue, Player element) => previousValue += element.kills,
      );

  ///
  ///
  ///
  int get _sumDeaths => widget.players.fold(
        0,
        (int previousValue, Player element) => previousValue += element.deaths,
      );

  ///
  ///
  ///
  @override
  bool get wantKeepAlive => true;

  ///
  ///
  ///
  Widget _playerListTileHeader() {
    return const ListTile(
      title: SelectableText('Player name'),
      trailing: Wrap(
        children: <Widget>[
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
            if (!player.isAi) {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Wrap(
                    children: <Widget>[
                      CustomPlayerDetailModal(
                        player: player,
                        onAddRemoveFriendTap: () => _addOrRemoveFriend(
                          isFriendNotifier,
                          player,
                        ),
                        onViewStatsTap: () => _openPlayerStats(player),
                        isFriend: isFriend,
                      ),
                    ],
                  );
                },
              );
            }
          },
        );
      },
    );
  }

  ///
  ///
  ///
  void _openPlayerStats(Player player) {
    String encodedUri = Uri.encodeFull(
      'https://prstats.realitymod.com/player/find?name=${player.prStatsNormalizedPlayerName}',
    );
    launchUrlString(encodedUri, mode: LaunchMode.externalApplication);
  }

  ///
  ///
  ///
  void _addOrRemoveFriend(ValueNotifier<bool> isFriend, Player player) {
    if (isFriend.value) {
      _config.removeFriend(
        _config.friends.firstWhere(
          (Friend element) => element.nickname == player.playerName,
        ),
      );

      isFriend.value = false;
    } else {
      _config.addFriend(player);
      isFriend.value = true;
    }
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isFriend.value ? 'Friend added' : 'Friend Removed'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
