import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:prspy/models/server.dart';
import 'package:prspy/widgets/custom_server_list_tile_subtitle.dart';

///
///
///
class CustomServerListTile extends StatelessWidget {
  final Server server;
  final Function() onTap;

  ///
  ///
  ///
  const CustomServerListTile({
    required this.server,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        horizontalTitleGap: 0,
        minLeadingWidth: 25,
        leading: Container(
          height: double.infinity,
          child: _serverFlag(),
        ),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            server.properties.hostname.trim(),
          ),
        ),
        subtitle: CustomServerListTileSubtitle(
          serverProperties: server.properties,
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.white,
        ),
        onTap: onTap,
      ),
    );
  }

  ///
  ///
  ///
  Widget _serverFlag() {
    if (server.countryFlag != '??') {
      return Flag.fromString(
        server.countryFlag,
        width: 17,
        height: 17,
      );
    }
    return Image.asset(
      'assets/flags/unknown.png',
      height: 17,
      width: 17,
    );
  }
}
