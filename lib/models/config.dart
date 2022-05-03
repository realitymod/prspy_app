import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:prspy/models/friend.dart';
import 'package:prspy/models/player.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
///
///
class Config {
  static Config _config = Config._internal();

  ///
  ///
  ///
  factory Config() {
    return _config;
  }

  List<Friend> friends = <Friend>[];

  ValueNotifier<int> friendsListNotifier = ValueNotifier<int>(0);

  ///
  ///
  ///
  void addFriend(Player player) {
    friends.add(Friend(nickname: player.playerName));
    friendsListNotifier.value = friends.length;
    _saveFriends();
  }

  ///
  ///
  ///
  void removeFriend(Friend friend) {
    friends.remove(friend);
    friendsListNotifier.value = friends.length;
    _saveFriends();
  }

  ///
  ///
  ///
  Future<void> _saveFriends({SharedPreferences? preferences}) async {
    preferences ??= await SharedPreferences.getInstance();
    await preferences.setStringList(
      'friends',
      friends.map((Friend e) => e.nickname).toList(),
    );
  }

  ///
  ///
  ///
  Future<void> loadFriends({SharedPreferences? preferences}) async {
    preferences ??= await SharedPreferences.getInstance();
    List<String>? friends = await preferences.getStringList('friends');
    if (friends != null) {
      for (String friend in friends) {
        this.friends.add(Friend(nickname: friend));
      }
    }
    friendsListNotifier.value = this.friends.length;
  }

  ///
  ///
  ///
  Config._internal();

  bool hideEmptyServers = false;
  bool hidePasswordedServers = false;
  bool hideCoopServers = false;
}
