import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:prspy/models/server.dart';
import 'package:prspy/widgets/custom_server_list_tile_subtitle.dart';

///
///
///
class CustomServerListTile extends StatelessWidget {
  final Server server;
  final int index;

  ///
  ///
  ///
  const CustomServerListTile({
    required this.server,
    required this.index,
    Key? key,
  }) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
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
          style: TextStyle(
            color: Colors.black,
            fontWeight: index.isEven ? null : FontWeight.w400,
          ),
        ),
        subtitle: CustomServerListTileSubtitle(
          serverProperties: server.properties!,
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.black,
        ),
      ),
    );
  }
}
