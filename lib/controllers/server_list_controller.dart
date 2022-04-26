import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:prspy/consumers/server_info_consumer.dart';
import 'package:prspy/enums/fetch_status.dart';
import 'package:prspy/models/server.dart';

///
///
///
class ServerListController {
  final BuildContext context;
  ObserverList<Server>? filteredServers;
  ObserverList<Server>? _servers;
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
      _servers = await consumer.fetchServerList();
      filteredServers = _servers;
      fetchStatus.value = FetchStatus.fetched;
    } catch (err) {
      if (filteredServers != null) {
        fetchStatus.value = FetchStatus.fetched;
      } else {
        fetchStatus.value = FetchStatus.error;
      }
    }
  }
}
