import 'package:flutter/material.dart';
import 'package:prspy/models/server.dart';
import 'package:prspy/nullable_string_helper.dart';

///
///
///
class CustomServerInformation extends StatelessWidget {
  final Server server;

  ///
  ///
  ///
  const CustomServerInformation({
    required this.server,
    Key? key,
  }) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (!server.properties!.bf2SponsorlogoUrl.isNullOrEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Image.network(server.properties!.bf2SponsorlogoUrl!),
                ),
              FittedBox(
                child: Text(server.properties!.hostname.trim()),
              ),
              Text(server.properties!.mapname!),
              Text(
                '[${server.properties!.bf2Mapsize} - ${server.properties!.gametype}]',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
