import 'package:flutter/material.dart';
import 'package:prspy/consumers/server_info_consumer.dart';
import 'package:prspy/models/server.dart';
import 'package:prspy/models/server_properties.dart';

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
  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Server>?>(
        future: widget.serverInfoConsumer.fetchServerList(),
        builder: (BuildContext context, AsyncSnapshot<List<Server>?> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  SizedBox(
                    height: 75,
                    width: 75,
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  Text('Fetching servers'),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: const <Widget>[
                  Icon(Icons.warning),
                  Text(
                    'Failed to fetch server data.\nTry again later.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else {
            List<Server> servers = snapshot.data!;
            return ListView.separated(
              itemCount: servers.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                Server server = servers.elementAt(index);
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(server.properties!.hostname),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            _playerQuantity(server.properties!),
                            _mapName(server.properties!),
                            _gameMode(server.properties!),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  ///
  ///
  ///
  Widget _playerQuantity(Properties properties) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            const Text(
              'Players',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${properties.numplayers}/${properties.maxplayers}',
              textAlign: TextAlign.start,
            )
          ],
        )
      ],
    );
  }

  ///
  ///
  ///
  Widget _mapName(Properties properties) {
    return Column(
      children: <Widget>[
        const Text(
          'Map Name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          properties.mapname!,
        ),
      ],
    );
  }

  ///
  ///
  ///
  Widget _gameMode(Properties properties) {
    return Column(
      children: <Widget>[
        const Text(
          'Game Mode',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          properties.gametype!.split('_').last.toUpperCase(),
        ),
      ],
    );
  }
}
