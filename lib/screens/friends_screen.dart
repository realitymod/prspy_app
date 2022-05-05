import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prspy/models/config.dart';
import 'package:prspy/models/friend.dart';
import 'package:prspy/models/player.dart';
import 'package:prspy/models/server.dart';
import 'package:prspy/screens/server_detail_screen.dart';
import 'package:prspy/widgets/custom_friend_list_tile.dart';

///
///
///
class FriendsScreen extends StatefulWidget {
  final List<Server> servers;

  ///
  ///
  ///
  const FriendsScreen({required this.servers, Key? key}) : super(key: key);

  ///
  ///
  ///
  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

///
///
///
class _FriendsScreenState extends State<FriendsScreen> {
  final Config _config = Config();

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Friends'),
        ),
        body: ValueListenableBuilder<int>(
          valueListenable: _config.friendsListNotifier,
          builder: (BuildContext context, int value, Widget? child) {
            if (value == 0) {
              return const Center(
                child: Text('You haven\'t added any friends yet.'),
              );
            }
            return FutureBuilder<void>(
              future: _loadFriends(),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CupertinoActivityIndicator());
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: _config.friends.length,
                  itemBuilder: (BuildContext context, int index) {
                    Friend friend = _config.friends[index];
                    return CustomFriendListTile(
                      friend: friend,
                      onDismissed: () => _removeFriend(friend),
                      onTap: !friend.isOnline
                          ? null
                          : () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) => ServerDetailScreen(
                                    server: widget.servers.firstWhere(
                                      (Server server) =>
                                          server.serverId == friend.serverId,
                                    ),
                                  ),
                                ),
                              );
                            },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  ///
  ///
  ///
  void _removeFriend(Friend friend) {
    _config.removeFriend(friend);
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Friend removed'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  ///
  ///
  ///
  void _sortOnlineFirst() {
    _config.friends.sort(
      (Friend a, Friend b) {
        if (b.isOnline) {
          return 1;
        }
        return -1;
      },
    );
  }

  ///
  ///
  ///
  Future<void> _loadFriends() async {
    final Config _config = Config();
    for (Friend friend in _config.friends) {
      for (Server server in widget.servers) {
        if (server.players.any((Player element) =>
            element.playerName.trim() == friend.nickname.trim())) {
          friend.isOnline = true;
          friend.serverId = server.serverId;
          friend.serverName = server.properties.hostname;
        }
      }
    }
    _sortOnlineFirst();
  }
}
