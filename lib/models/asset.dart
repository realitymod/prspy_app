///
///
///
class Asset {
  ///
  ///
  ///
  static List<Asset> defaultAssets = <Asset>[];

  late String key;
  late String name;
  String? icon;

  ///
  ///
  ///
  Asset();

  ///
  ///
  ///
  Asset.fromJson(Map<String, dynamic> map) {
    key = map['Key'];
    name = map['Name'];
    icon = map['Icon'];
  }

  ///
  ///
  ///
  String get iconAssetPath => 'assets/images/assetIcons/$icon.png';
}
