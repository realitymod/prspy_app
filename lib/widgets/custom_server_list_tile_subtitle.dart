import 'package:flutter/material.dart';
import 'package:prspy/models/server_properties.dart';

///
///
///
class CustomServerListTileSubtitle extends StatelessWidget {
  final ServerProperties serverProperties;

  ///
  ///
  ///
  const CustomServerListTileSubtitle({
    required this.serverProperties,
    Key? key,
  }) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '${serverProperties.numplayers}/${serverProperties.maxplayers}',
        ),
        Row(
          children: <Widget>[
            Text(
              '${serverProperties.mapname} - ',
            ),
            Text(
              '[${serverProperties.gametype} ${serverProperties.bf2Mapsize}]',
            ),
          ],
        )
      ],
    );
  }
}
