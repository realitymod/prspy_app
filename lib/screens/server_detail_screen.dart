import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:prspy/models/server.dart';

///
///
///
class ServerDetailScreen extends StatefulWidget {
  final Server server;

  ///
  ///
  ///
  const ServerDetailScreen({required this.server, Key? key}) : super(key: key);

  ///
  ///
  ///
  @override
  State<ServerDetailScreen> createState() => _ServerDetailScreenState();
}

///
///
///
class _ServerDetailScreenState extends State<ServerDetailScreen> {
  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 25,
        title: SizedBox(
          height: AppBar().preferredSize.height,
          child: Marquee(
            text: widget.server.properties!.hostname,
            blankSpace: 1,
            velocity: 20,
            startPadding: 1,
            numberOfRounds: 1,
          ),
        ),
      ),
    );
  }
}
