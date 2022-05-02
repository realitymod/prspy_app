import 'package:flutter/material.dart';
import 'package:prspy/models/config.dart';
import 'package:prspy/models/friend.dart';

///
///
///
class FriendsScreen extends StatefulWidget {
  ///
  ///
  ///
  const FriendsScreen({Key? key}) : super(key: key);

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
            return ListView.builder(
              itemCount: _config.friends.length,
              itemBuilder: (BuildContext context, int index) {
                Friend friend = _config.friends[index];
                return ListTile(
                  title: Text(friend.nickname),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
