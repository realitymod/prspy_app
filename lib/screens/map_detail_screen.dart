import 'package:flutter/material.dart';
import 'package:prspy/consumers/map_gallery_consumer.dart';
import 'package:prspy/models/map_detail.dart';
import 'package:prspy/models/map_detail_dto.dart';
import 'package:prspy/widgets/custom_fetching_data_indicator.dart';
import 'package:prspy/widgets/custom_map_assets_listview.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
    return FutureBuilder<MapDetailDTO>(
      future: _fetchMapDetail(),
      builder: (BuildContext context, AsyncSnapshot<MapDetailDTO> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: _pageTitle(),
              actions: <Widget>[
                _viewInMapGallery(),
              ],
            ),
            body: const CustomFetchingDataIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: _pageTitle(),
              actions: <Widget>[
                _viewInMapGallery(),
              ],
            ),
            body: const Center(child: Text('Failed to fetch map data')),
          );
        }
        final MapDetailDTO mapDetail = snapshot.data!;
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: _pageTitle(),
              actions: <Widget>[
                _viewInMapGallery(),
              ],
              bottom: TabBar(
                tabs: <Tab>[
                  Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          mapDetail.teams!.last.name,
                          style: const TextStyle(color: Colors.blue),
                        ),
                        Text('${mapDetail.teams!.last.tickets} Tickets'),
                      ],
                    ),
                  ),
                  Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          mapDetail.teams!.first.name,
                          style: const TextStyle(color: Colors.red),
                        ),
                        Text('${mapDetail.teams!.first.tickets} Tickets'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                CustomMapAssetsListView(assets: mapDetail.team1Assets!),
                CustomMapAssetsListView(assets: mapDetail.team2Assets!),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _pageTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${widget.mapModel.name}',
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          '${widget.mapModel.normalizedLayout} ${widget.mapModel.normalizedGameType}',
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  ///
  ///
  ///
  Widget _viewInMapGallery() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: TextButton.icon(
        onPressed: () {
          launchUrlString(widget.mapModel.mapGaleryUrl);
        },
        label: const Text('Map Gallery'),
        icon: const Icon(Icons.open_in_new),
        style: TextButton.styleFrom(),
      ),
    );
  }

  ///
  ///
  ///
  Future<MapDetailDTO> _fetchMapDetail() async {
    await _consumer.fetchAssetList();
    return _consumer.fetchMapGalleryDetail(
      widget.mapModel,
    );
  }
}
