///
///
///
class Asset {
  ///
  ///
  ///
  static List<Asset> defaultAssets = <Asset>[];

  late String key;
  String? name;
  String? icon;

  ///
  ///
  ///
  Asset();

  ///
  ///
  ///
  Asset.fromJson(Map<String, dynamic> map) {
    key = map['key'];
    name = map['name'];
    icon = map['icon'];
  }

  ///
  ///
  ///
  String get iconAssetPath => 'assets/images/assetIcons/$icon.png';
}
