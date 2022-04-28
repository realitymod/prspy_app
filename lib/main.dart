import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:prspy/consumers/server_info_consumer.dart';
import 'package:prspy/screens/server_list_screen.dart';

///
///
///
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// The code below gives the application updated CA certificates.
  /// It is necessary to do this because on very old Android and iOS devices,
  /// the certificates have already expired and because of this the app is unable to make requests.
  ByteData data = await PlatformAssetBundle().load('assets/ca/certificate.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asInt8List());

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
