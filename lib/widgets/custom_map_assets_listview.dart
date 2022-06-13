import 'package:flutter/material.dart';
import 'package:prspy/models/map_asset.dart';

///
///
///
class CustomMapAssetsListView extends StatelessWidget {
  final List<MapAsset> assets;

  ///
  ///
  ///
  const CustomMapAssetsListView({required this.assets, Key? key}) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 3),
      itemCount: assets.length,
      itemBuilder: (BuildContext context, int index) {
        MapAsset asset = assets[index];
        return Card(
          child: ListTile(
            leading: Container(
              height: double.infinity,
              child: Image.asset(
                asset.getIconAssetPath,
                height: 40,
                width: 40,
              ),
            ),
            title: Text('${asset.amount}x ${asset.name}'),
            isThreeLine: asset.initialDelay > 0,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${asset.respawnDelayConverted}'),
                if (asset.initialDelay > 0) Text('Delayed: ${asset.initialDelayConverted}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
