import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:prspy/consumers/server_info_consumer.dart';
import 'package:prspy/models/server.dart';

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
                return Card(
                  color: index.isEven ? Colors.white38 : Colors.white60,
                  child: ListTile(
                    horizontalTitleGap: 0,
                    minLeadingWidth: 25,
                    dense: true,
                    leading: Container(
                      height: double.infinity,
                      child: Flag.fromString(
                        server.countryFlag!,
                        width: 17,
                        height: 17,
                      ),
                    ),
                    title: Text(
                      server.properties!.hostname.trim(),
                      style: _listTileTextStyle(index),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${server.properties!.numplayers}/${server.properties!.maxplayers}',
                          style: _listTileTextStyle(index),
                        ),
                        Text(
                          '[${server.properties!.gametype} ${server.properties!.bf2Mapsize}]',
                          style: _listTileTextStyle(index),
                        ),
                        Text(
                          server.properties!.mapname!,
                          style: _listTileTextStyle(index),
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

  TextStyle _listTileTextStyle(int index) {
    return TextStyle(
      color: Colors.black,
      fontWeight: index.isEven ? null : FontWeight.w400,
    );
  }
}
