import 'package:flutter/material.dart';
import 'package:prspy/screens/friends_screen.dart';
import 'package:prspy/widgets/custom_app_version_indicator.dart';
import 'package:url_launcher/url_launcher_string.dart';

///
///
///
class CustomMainDrawer extends StatelessWidget {
  ///
  ///
  ///
  const CustomMainDrawer({Key? key}) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                DrawerHeader(
                  child: Image.asset(
                    'assets/images/pr_logo.png',
                  ),
                ),
                ListTile(
                  title: const Text('Friends'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const FriendsScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  style: ListTileStyle.drawer,
                  title: Wrap(
                    children: const <Widget>[
                      Text('Map Gallery'),
                      Icon(
                        Icons.open_in_new,
                        size: 10,
                      ),
                    ],
                  ),
                  onTap: () {
                    launchUrlString('https://www.realitymod.com/mapgallery/');
                  },
                ),
                ListTile(
                  style: ListTileStyle.drawer,
                  title: Wrap(
                    children: const <Widget>[
                      Text('Forums'),
                      Icon(
                        Icons.open_in_new,
                        size: 10,
                      ),
                    ],
                  ),
                  onTap: () {
                    launchUrlString('https://www.realitymod.com/forum/');
                  },
                ),
                ListTile(
                  style: ListTileStyle.drawer,
                  title: Wrap(
                    children: const <Widget>[
                      Text('Donate'),
                      Icon(
                        Icons.open_in_new,
                        size: 10,
                      ),
                    ],
                  ),
                  onTap: () {
                    launchUrlString(
                      'https://www.realitymod.com/forum/misc.php?do=donate',
                    );
                  },
                ),
                ListTile(
                  style: ListTileStyle.drawer,
                  title: Wrap(
                    children: const <Widget>[
                      Text('News'),
                      Icon(
                        Icons.open_in_new,
                        size: 10,
                      ),
                    ],
                  ),
                  onTap: () {
                    launchUrlString('https://www.realitymod.com/');
                  },
                ),
              ],
            ),
            const CustomAppVersionIndicator(),
          ],
        ),
      ),
    );
  }
}
