import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:prspy/consumers/server_info_consumer.dart';
import 'package:prspy/screens/server_list_screen.dart';

///
///
///
void main() {
  runApp(const MyApp());
}

///
///
///
class MyApp extends StatelessWidget {
  ///
  ///
  ///
  const MyApp({Key? key}) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PRSPY',
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      home: ServerListScreen(
        serverInfoConsumer: ServerInfoConsumer(
          client: Client(),
        ),
      ),
    );
  }
}
