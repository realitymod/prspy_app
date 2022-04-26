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
          style: _textStyle,
        ),
        Row(
          children: <Widget>[
            Text(
              '${serverProperties.mapname} - ',
              style: _textStyle,
            ),
            Text(
              '[${serverProperties.gametype} ${serverProperties.bf2Mapsize}]',
              style: _textStyle,
            ),
          ],
        )
      ],
    );
  }

  TextStyle get _textStyle => TextStyle(color: Colors.black);
}
