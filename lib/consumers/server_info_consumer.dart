import 'dart:convert';

import 'package:http/http.dart';
import 'package:prspy/models/server.dart';

///
///
///
class ServerInfoConsumer {
  late final Client _httpClient;

  ///
  ///
  ///
  ServerInfoConsumer({Client? httpClient})
      : _httpClient = httpClient ?? Client();

  ///
  ///
  ///
  Future<List<Server>> fetchServerList() async {
    Response response = await _httpClient.get(
      Uri.https('servers.realitymod.com', 'api/ServerInfo'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> serversJson = json.decode(response.body);
      List<Server> servers = <Server>[];
      for (Map<String, dynamic> serverData in serversJson['servers']) {
        servers.add(Server.fromJson(serverData));
      }
      return servers;
    }
    throw Exception('Failed to fetch updated server data.\nTry again later');
  }
}
