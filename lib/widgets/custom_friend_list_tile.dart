import 'package:flutter/material.dart';
import 'package:prspy/models/friend.dart';

///
///
///
class CustomFriendListTile extends StatelessWidget {
  final Friend friend;
  final Function() onDismissed;
  final Function()? onTap;

  ///
  ///
  ///
  const CustomFriendListTile({
    required this.friend,
    required this.onDismissed,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Card(
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Icon(Icons.delete),
                Icon(Icons.delete),
              ],
            ),
          ),
        ),
      ),
      onDismissed: (DismissDirection direction) {
        onDismissed();
      },
      key: Key(friend.nickname),
      child: Card(
        child: ListTile(
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
          trailing: !friend.isOnline ? null : const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
      ),
    );
  }
}
