import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:prspy/consumers/server_info_consumer.dart';
import 'package:prspy/enums/fetch_status.dart';
import 'package:prspy/models/config.dart';
import 'package:prspy/models/server.dart';

///
///
///
class ServerListController {
  final BuildContext context;
  List<Server> filteredServers = <Server>[];
  List<Server> allServers = <Server>[];
  final Config _config = Config();
  final ValueNotifier<FetchStatus> fetchStatus = ValueNotifier<FetchStatus>(
    FetchStatus.fetching,
  );

  ///
  ///
  ///
  ServerListController({
    required this.context,
  });

  ///
  ///
  ///
  Future<void> fetchServers({required ServerInfoConsumer consumer}) async {
    try {
      fetchStatus.value = FetchStatus.fetching;
      allServers = await consumer.fetchServerList();
      allServers.sort(
        (Server a, Server b) =>
            b.properties.numplayers.compareTo(a.properties.numplayers),
      );
      filteredServers = allServers;
      fetchStatus.value = FetchStatus.fetched;
    } catch (err, stack) {
      log(err.toString());
      log(stack.toString());
      if (filteredServers.isNotEmpty) {
        fetchStatus.value = FetchStatus.fetched;
      } else {
        fetchStatus.value = FetchStatus.error;
      }
    }
  }

  ///
  ///
  ///
  void applyFilters() {
    fetchStatus.value = FetchStatus.fetching;
    filteredServers = allServers;
    _showHideEmptyServers();
    _showHidePasswordedServers();
    _showHideCoopServers();
    fetchStatus.value = FetchStatus.fetched;
  }

  ///
  ///
  ///
  void _showHideEmptyServers() {
    if (_config.hideEmptyServers) {
      filteredServers = filteredServers
          .where((Server server) => server.properties.numplayers != 0)
          .toList();
    }
  }

  ///
  ///
  ///
  void _showHidePasswordedServers() {
    if (_config.hidePasswordedServers) {
      filteredServers = filteredServers
          .where((Server server) => server.properties.password == 0)
          .toList();
    }
  }

  ///
  ///
  ///
  void _showHideCoopServers() {
    if (_config.hideCoopServers) {
      filteredServers = filteredServers
          .where((Server server) => server.properties.map.gameType != 'Co-Op')
          .toList();
    }
  }
}
