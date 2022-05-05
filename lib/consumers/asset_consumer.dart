import 'dart:convert';

import 'package:http/http.dart';
import 'package:prspy/models/asset.dart';

///
///
///
class AssetConsumer {
  late final Client _httpClient;

  ///
  ///
  ///
  AssetConsumer({Client? httpClient}) {
    this._httpClient = httpClient ?? Client();
  }

  ///
  ///
  ///
  Future<void> fetchAssetList() async {
    Response response = await _httpClient.get(
      Uri.https('realitymod.com', 'mapgallery/json/vehicles.json'),
    );
    if (response.statusCode == 200) {
      List<dynamic> vehiclesJson = json.decode(response.body);
      for (Map<String, dynamic> vehiclesData in vehiclesJson) {
        Asset.defaultAssets.add(Asset.fromJson(vehiclesData));
      }
    }
    throw Exception('Failed to fetch updated server data.\nTry again later');
  }
}
