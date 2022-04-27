import 'package:flutter/material.dart';
import 'package:prspy/models/server.dart';
import 'package:prspy/nullable_string_helper.dart';
import 'package:prspy/widgets/custom_description.dart';

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
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  server.properties!.hostname.trim(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              if (!server.properties!.bf2SponsorlogoUrl.isNullOrEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Image.network(server.properties!.bf2SponsorlogoUrl!),
                ),
              CustomDescription(
                label: 'Map:',
                value: server.properties!.mapname!,
              ),
              CustomDescription(
                label: 'Gamemode:',
                value:
                    '${server.properties!.bf2Mapsize} - ${server.properties!.gametype}',
              ),
              CustomDescription(
                label: 'Players:',
                value:
                    '${server.properties!.numplayers}/${server.properties!.maxplayers}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
