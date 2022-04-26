import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:prspy/models/player.dart';
import 'package:prspy/models/server.dart';
import 'package:prspy/widgets/custom_player_list.dart';

///
///
///
class ServerDetailScreen extends StatefulWidget {
  final Server server;

  ///
  ///
  ///
  const ServerDetailScreen({required this.server, Key? key}) : super(key: key);

  ///
  ///
  ///
  @override
  State<ServerDetailScreen> createState() => _ServerDetailScreenState();
}

///
///
///
class _ServerDetailScreenState extends State<ServerDetailScreen> {
  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 25,
          title: SizedBox(
            height: AppBar().preferredSize.height,
            child: Marquee(
              text: widget.server.properties!.hostname,
              blankSpace: 150,
              numberOfRounds: 1,
            ),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(widget.server.properties!.bf2Team2!),
              ),
              Tab(
                child: Text(widget.server.properties!.bf2Team1!),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {},
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            CustomPlayerList(
              players: widget.server.players
                  .where((Player player) => player.team == 2)
                  .toList(),
            ),
            CustomPlayerList(
              players: widget.server.players
                  .where((Player player) => player.team == 1)
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
