import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
  if (!kIsWeb) {
    ByteData data =
        await PlatformAssetBundle().load('assets/ca/certificate.pem');
    SecurityContext.defaultContext
        .setTrustedCertificatesBytes(data.buffer.asInt8List());
  }

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
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('pt', 'BR'),
        Locale('es', ''),
        Locale('fr', ''),
        Locale('en', ''),
        Locale('ch', ''),
        Locale('jp', ''),
        Locale('ru', ''),
      ],
    );
  }
}
