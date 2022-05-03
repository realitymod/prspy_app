import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prspy/models/config.dart';
import 'package:prspy/models/friend.dart';
import 'package:prspy/models/player.dart';
import 'package:prspy/models/server.dart';
import 'package:prspy/screens/server_detail_screen.dart';

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
                _config.friends.sort(
                  (Friend a, Friend b) {
                    if (b.isOnline) {
                      return 1;
                    }
                    return -1;
                  },
                );
                return ListView.separated(
                  key: UniqueKey(),
                  itemCount: _config.friends.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    color: Colors.white,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    Friend friend = _config.friends[index];
                    return ListTile(
                      title: Text(
                        friend.nickname,
                        style: TextStyle(
                          color: friend.isOnline ? Colors.green : Colors.grey,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          if (friend.isOnline)
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(friend.serverName!.trim()),
                            ),
                          Text(friend.isOnline ? 'Online' : 'Offline'),
                        ],
                      ),
                      trailing: !friend.isOnline
                          ? null
                          : Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: const <Widget>[
                                Text('Go to Server'),
                                Icon(Icons.chevron_right),
                              ],
                            ),
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
  }
}
