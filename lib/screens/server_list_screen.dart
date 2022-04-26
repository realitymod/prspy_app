import 'package:flutter/material.dart';
import 'package:prspy/consumers/server_info_consumer.dart';
import 'package:prspy/models/server.dart';
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
  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PRSPY'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),
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
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Fetching servers'),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
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
          } else {
            List<Server> servers = snapshot.data!;
            return ListView.builder(
              itemCount: servers.length,
              itemBuilder: (BuildContext context, int index) {
                Server server = servers.elementAt(index);
                return CustomServerListTile(
                  server: server,
                  index: index,
                );
              },
            );
          }
        },
      ),
    );
  }
}
