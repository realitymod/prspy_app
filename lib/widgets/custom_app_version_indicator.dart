import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';

///
///
///
class CustomAppVersionIndicator extends StatelessWidget {
  ///
  ///
  ///
  const CustomAppVersionIndicator({Key? key}) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const CupertinoActivityIndicator();
        }
        PackageInfo pkgInfo = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.all(8),
          child: Text('${pkgInfo.version}'),
        );
      },
    );
  }
}
