import 'package:flutter/material.dart';
import 'package:prspy/models/player.dart';
import 'package:prspy/widgets/custom_description.dart';

///
///
///
class CustomPlayerDetailModal extends StatelessWidget {
  final Player player;
  final Function() onAddRemoveFriendTap;
  final Function() onViewStatsTap;
  final bool isFriend;

  ///
  ///
  ///
  const CustomPlayerDetailModal({
    required this.player,
    required this.onAddRemoveFriendTap,
    required this.onViewStatsTap,
    required this.isFriend,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomDescription(
              label: 'Player name:',
              value: player.name,
              valuePadding: EdgeInsets.zero,
              labelStyle: const TextStyle(
                fontSize: 20,
                color: Colors.blueAccent,
              ),
              valueStyle: const TextStyle(fontSize: 20),
            ),
            if (player.clan != null)
              CustomDescription(
                label: 'Clan:',
                value: player.clan!,
                valuePadding: EdgeInsets.zero,
                labelStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.blueAccent,
                ),
                valueStyle: const TextStyle(fontSize: 20),
              ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onAddRemoveFriendTap,
                    label: Text(
                      isFriend ? 'Remove Friend' : 'Add Friend',
                      textAlign: TextAlign.center,
                    ),
                    icon: Icon(
                      isFriend ? Icons.person_remove : Icons.person_add,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isFriend ? Colors.redAccent : Colors.green,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onViewStatsTap,
                    label: const Text(
                      'View player stats',
                      textAlign: TextAlign.center,
                    ),
                    icon: const Icon(Icons.open_in_new),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
