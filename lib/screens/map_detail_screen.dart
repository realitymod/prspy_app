import 'package:flutter/material.dart';
import 'package:prspy/consumers/map_gallery_consumer.dart';
import 'package:prspy/models/asset.dart';
import 'package:prspy/models/map_asset.dart';
import 'package:prspy/models/map_detail.dart';
import 'package:prspy/models/map_detail_dto.dart';
import 'package:prspy/widgets/custom_fetching_data_indicator.dart';

///
///
///
class MapDetailScreen extends StatefulWidget {
  final MapDetail mapModel;
  final MapGalleryConsumer? consumer;

  ///
  ///
  ///
  const MapDetailScreen({
    required this.mapModel,
    this.consumer,
    Key? key,
  }) : super(key: key);

  ///
  ///
  ///
  @override
  State<MapDetailScreen> createState() => _MapDetailScreenState();
}

///
///
///
class _MapDetailScreenState extends State<MapDetailScreen> {
  late final MapGalleryConsumer _consumer;

  ///
  ///
  ///
  @override
  void initState() {
    super.initState();
    _consumer = widget.consumer ?? MapGalleryConsumer();
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.mapModel.name} ${widget.mapModel.layout} ${widget.mapModel.gameType}',
        ),
      ),
      body: FutureBuilder<MapDetailDTO>(
        future: _fetchMapDetail(),
        builder: (
          BuildContext context,
          AsyncSnapshot<MapDetailDTO> snapshot,
        ) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const CustomFetchingDataIndicator();
          }
          if (snapshot.hasError) {
            return const Text('Failed to fetch map data');
          }
          MapDetailDTO mapDetails = snapshot.data!;
          return Column(
            children: <Widget>[
              Text(mapDetails.assets!.first.name),
            ],
          );
        },
      ),
    );
  }

  ///
  ///
  ///
  Future<MapDetailDTO> _fetchMapDetail() async {
    await _consumer.fetchAssetList();
    MapDetailDTO mapDetailDTO = await _consumer.fetchMapGalleryDetail(
      widget.mapModel,
    );

    for (MapAsset asset in mapDetailDTO.assets!) {
      asset.name = Asset.defaultAssets
          .firstWhere((Asset element) => element.key == asset.key)
          .name;
    }
    return mapDetailDTO;
  }
}
