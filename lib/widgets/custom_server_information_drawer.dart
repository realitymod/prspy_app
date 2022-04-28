import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:prspy/models/server.dart';
import 'package:prspy/nullable_string_helper.dart';
import 'package:prspy/widgets/custom_description.dart';
import 'package:url_launcher/url_launcher_string.dart';

///
///
///
class CustomServerInformationDrawer extends StatelessWidget {
  final Server server;

  ///
  ///
  ///
  const CustomServerInformationDrawer({
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
                  server.properties.hostname.trim(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              if (!server.properties.bf2SponsorlogoUrl.isNullOrEmpty)
                GestureDetector(
                  onTap: () {
                    launchUrlString(server.properties.bf2CommunitylogoUrl);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Image.network(server.properties.bf2SponsorlogoUrl),
                  ),
                ),
              CustomDescription(
                label: 'Map:',
                value: '${server.properties.map.name} '
                    '${server.properties.map.gameType} '
                    '${server.properties.map.layout}',
              ),
              CustomDescription(
                label: 'Players:',
                value:
                    '${server.properties.numplayers}/${server.properties.maxplayers} '
                    '(${server.properties.bf2Reservedslots})',
              ),
              if (!server.properties.nextMap.isNullOrEmpty)
                CustomDescription(
                  label: 'Next map:',
                  value: server.properties.nextMap,
                ),
              CustomDescription(
                label: 'Server version:',
                value: server.properties.serverVersion,
              ),
              CustomDescription(
                label: 'Server Message',
                value: server.properties.bf2Sponsortext.trim(),
                valueTextAlign: TextAlign.justify,
              ),
              if (!server.properties.bf2CommunitylogoUrl.isNullOrEmpty)
                GestureDetector(
                  onTap: () {
                    launchUrlString(server.properties.bf2CommunitylogoUrl);
                  },
                  child: CustomDescription(
                    label: 'Community',
                    value: server.properties.bf2CommunitylogoUrl,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Flag.fromString(
                      server.countryFlag,
                      width: 25,
                      height: 25,
                    ),
                    Tooltip(
                      message: server.properties.bf2Os.contains('linux')
                          ? 'Linux server'
                          : 'Windows Server',
                      child: SizedBox(
                        width: 22,
                        height: 22,
                        child: Image.asset(
                          'assets/images/${server.properties.bf2Os}',
                        ),
                      ),
                    ),
                    if (server.properties.password == 1)
                      Tooltip(
                        message: 'Passworded',
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 25,
                            maxHeight: 25,
                          ),
                          child: const Icon(
                            Icons.lock,
                          ),
                        ),
                      ),
                    if (server.hasMumble)
                      Tooltip(
                        message: 'Mumble VOIP enabled',
                        child: Container(
                          constraints: const BoxConstraints(
                            maxWidth: 25,
                            maxHeight: 25,
                          ),
                          child: const Icon(
                            Icons.headset,
                          ),
                        ),
                      ),
                    if (!server.properties.bf2DDl.isNullOrEmpty)
                      Container(
                        child: IconButton(
                          constraints: const BoxConstraints(
                            maxWidth: 25,
                            maxHeight: 25,
                          ),
                          tooltip:
                              'BattleRecorder Enabled, click to visit BR Downloads page',
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.play_arrow_sharp),
                          splashRadius: 1,
                          onPressed: () {
                            launchUrlString(
                              server.properties.bf2DDl,
                              mode: LaunchMode.externalApplication,
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
