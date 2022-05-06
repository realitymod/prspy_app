import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:prspy/models/asset.dart';
import 'package:prspy/models/map_detail.dart';
import 'package:prspy/models/map_detail_dto.dart';

///
///
///
class MapGalleryConsumer {
  late final Client _httpClient;

  ///
  ///
  ///
  MapGalleryConsumer({Client? httpClient}) {
    this._httpClient = httpClient ?? Client();
  }

  ///
  ///
  ///
  Future<void> fetchAssetList() async {
    if (Asset.defaultAssets.isEmpty) {
      Response response = await _httpClient.get(
        Uri.https('realitymod.com', 'mapgallery/json/vehicles.json'),
      );
      if (response.statusCode == 200) {
        List<dynamic> vehiclesJson = json.decode(response.body);
        for (Map<String, dynamic> vehiclesData in vehiclesJson) {
          Asset.defaultAssets.add(Asset.fromJson(vehiclesData));
        }
      } else {
        throw Exception(
          'Failed to fetch updated server data.\nTry again later',
        );
      }
    }
  }

  ///
  ///
  ///
  Future<MapDetailDTO> fetchMapGalleryDetail(MapDetail mapDetail) async {
    Response response = await _httpClient.get(
      Uri.https(
        'realitymod.com',
        'mapgallery/json/${mapDetail.normalizedMapName}/${mapDetail.gameType}_${mapDetail.size}.json',
      ),
    );
    log(Uri.https(
      'realitymod.com',
      'mapgallery/json/${mapDetail.normalizedMapName}/${mapDetail.gameType}_${mapDetail.size}.json',
    ).toString());
    if (response.statusCode == 200) {
      Map<String, dynamic> mapGalleryJson = json.decode(response.body);
      return MapDetailDTO.fromJson(mapGalleryJson);
    }
    throw Exception();
  }
}
