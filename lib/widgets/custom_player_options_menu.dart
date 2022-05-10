import 'package:flutter/material.dart';
import 'package:prspy/models/player.dart';
import 'package:url_launcher/url_launcher_string.dart';

///
///
///
class CustomPlayerOptionsMenu extends StatelessWidget {
  final Player player;
  final Widget child;
  final bool isFriend;
  final Function() onFriendTap;

  ///
  ///
  ///
  const CustomPlayerOptionsMenu({
    required this.player,
    required this.child,
    required this.isFriend,
    required this.onFriendTap,
    Key? key,
  }) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<void>(
      child: child,
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<void>>[
          PopupMenuItem<void>(
            onTap: onFriendTap,
            child: Row(
              children: <Widget>[
                Icon(isFriend ? Icons.person_remove : Icons.person_add),
                Text(isFriend ? 'Remove Friend' : 'Add Friend'),
              ],
            ),
          ),
          PopupMenuItem<void>(
            child: Row(
              children: const <Widget>[
                Icon(Icons.open_in_new),
                Text('View player Status'),
              ],
            ),
            onTap: () {
              launchUrlString(
                'http://prstats.tk/${player.prStatsNormalizedPlayerName}',
                mode: LaunchMode.externalApplication,
              );
            },
          ),
        ].toList();
      },
    );
  }
}
