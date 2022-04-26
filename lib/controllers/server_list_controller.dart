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
  ObserverList<Server>? servers;
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
      servers = await consumer.fetchServerList();
      fetchStatus.value = FetchStatus.fetched;
    } catch (err) {
      fetchStatus.value = FetchStatus.error;
    }
  }
}
