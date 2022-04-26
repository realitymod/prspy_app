import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:prspy/models/server.dart';
import 'package:prspy/models/test_only.dart';

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
    // Response response = await _client.get(
    //   Uri.https('servers.realitymod.com', 'api/ServerInfo'),
    // );
    // print('Response status code ${response.statusCode}');

    // if (response.statusCode == 200) {
    // Map<String, dynamic> serversData = json.decode(response.body);

    //   List<Server> servers = <Server>[];
    //   for (dynamic server in serversData['servers']) {
    //     servers.add(Server.fromJson(server));
    //   }
    //   return servers;
    // }

    ObserverList<Server> servers = ObserverList<Server>();
    Map<String, dynamic> serverData = json.decode(TestOnly.serverList());
    for (dynamic server in serverData['servers']) {
      try {
        servers.add(Server.fromJson(server));
      } catch (err, stack) {
        log(err.toString());
        log(stack.toString());
      }
    }
    // await Future.delayed(Duration(seconds: 4));
    return servers;
    // throw const HttpException(
    //   'Failed to fetch PRSPY data.\nPlease try again later.',
    // );
  }
}
