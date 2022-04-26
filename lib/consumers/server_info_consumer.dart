import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:prspy/models/server.dart';

///
///
///
class ServerInfoConsumer {
  late final Client _client;

  ///
  ///
  ///
  ServerInfoConsumer({required Client client}) : _client = client;

  ///
  ///
  ///
  Future<ObserverList<Server>?> fetchServerList() async {
    Response response = await _client.get(
      Uri.https('servers.realitymod.com', 'api/ServerInfo'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> serversData = json.decode(response.body);

      ObserverList<Server> servers = ObserverList<Server>();
      for (dynamic server in serversData['servers']) {
        servers.add(Server.fromJson(server));
      }
      return servers;
    }
    throw Exception('Failed to fetch updated server data.\nTry again later');
  }
}
