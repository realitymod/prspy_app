///
///
///
class Friend {
  late String nickname;
  bool isOnline = false;
  String? serverId;
  String? serverName;

  ///
  ///
  ///
  Friend({required this.nickname});

  ///
  ///
  ///
  Friend.fromJson(Map<String, dynamic> map) {
    nickname = map['nickname'];
  }
}
