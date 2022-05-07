import 'package:flutter/material.dart';
import 'package:prspy/consumers/server_info_consumer.dart';
import 'package:prspy/controllers/server_list_controller.dart';
import 'package:prspy/enums/fetch_status.dart';
import 'package:prspy/models/server.dart';
import 'package:prspy/screens/server_detail_screen.dart';
import 'package:prspy/widgets/custom_fetching_data_indicator.dart';
import 'package:prspy/widgets/custom_filter_options.dart';
import 'package:prspy/widgets/custom_main_drawer.dart';
import 'package:prspy/widgets/custom_server_list_tile.dart';

///
///
///
class ServerListScreen extends StatefulWidget {
  final ServerInfoConsumer serverInfoConsumer;

  ///
  ///
  ///
  const ServerListScreen({
    required this.serverInfoConsumer,
    Key? key,
  }) : super(key: key);

  ///
  ///
  ///
  @override
  State<ServerListScreen> createState() => _ServerListScreenState();
}

///
///
///
class _ServerListScreenState extends State<ServerListScreen> {
  late final ServerListController _controller = ServerListController(
    context: context,
  );

  ///
  ///
  ///
  @override
  void initState() {
    super.initState();
    _controller.fetchServers(consumer: widget.serverInfoConsumer);
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ValueListenableBuilder<FetchStatus>(
        valueListenable: _controller.fetchStatus,
        builder: (BuildContext context, FetchStatus value, Widget? child) {
          return CustomMainDrawer(
            servers: _controller.allServers,
          );
        },
      ),
      appBar: AppBar(
        title: const Text('PRSPY'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _controller.fetchServers(consumer: widget.serverInfoConsumer);
            },
          ),
          CustomFilterOptions(
            onFilterChanged: _controller.applyFilters,
          ),
        ],
      ),
      body: ValueListenableBuilder<FetchStatus>(
        valueListenable: _controller.fetchStatus,
        builder: (BuildContext context, FetchStatus value, Widget? child) {
          switch (value) {
            case FetchStatus.fetching:
              return const CustomFetchingDataIndicator(
                message: 'Fetching servers',
              );
            case FetchStatus.fetched:
              return ListView.builder(
                itemCount: _controller.filteredServers.length,
                itemBuilder: (BuildContext context, int index) {
                  Server server = _controller.filteredServers.elementAt(index);
                  return CustomServerListTile(
                    server: server,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => ServerDetailScreen(server: server),
                        ),
                      );
                    },
                  );
                },
              );
            case FetchStatus.error:
              return _errorOnFetching();
          }
        },
      ),
    );
  }

  ///
  ///
  ///
  Widget _errorOnFetching() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Icon(
            Icons.warning,
            size: 45,
          ),
          Text(
            'Failed to fetch server data.\nTry again later.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
