import 'package:flutter/material.dart';
import 'package:prspy/models/server.dart';
import 'package:prspy/screens/friends_screen.dart';
import 'package:prspy/widgets/custom_app_version_indicator.dart';
import 'package:url_launcher/url_launcher_string.dart';

///
///
///
class CustomMainDrawer extends StatelessWidget {
  final List<Server> servers;

  ///
  ///
  ///
  const CustomMainDrawer({required this.servers, Key? key}) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  'assets/images/pr_logo.png',
                  height: 100,
                ),
              ),
              const Text('PRSPY Server Browser'),
              const CustomAppVersionIndicator(),
              ListTile(
                title: const Text('Friends'),
                subtitle: const Text('Your friends list'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => FriendsScreen(
                        servers: servers,
                      ),
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
                subtitle: const Text('Official Project Reality Map Gallery'),
                onTap: () {
                  launchUrlString('https://www.realitymod.com/mapgallery/');
                },
              ),
              ListTile(
                style: ListTileStyle.drawer,
                title: Wrap(
                  children: const <Widget>[
                    Text('Discord'),
                    Icon(
                      Icons.open_in_new,
                      size: 10,
                    ),
                  ],
                ),
                subtitle: const Text('Official Project Reality Discord'),
                onTap: () {
                  launchUrlString('https://discord.gg/gCnUwXTVaC');
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
                subtitle: const Text('Project Reality Forums'),
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
                subtitle: const Text('Donate To Support Project Reality'),
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
                subtitle: const Text('Latest PR News'),
                onTap: () {
                  launchUrlString('https://www.realitymod.com/');
                },
              ),
              ListTile(
                title: Wrap(
                  children: const <Widget>[
                    Text('Found a bug?'),
                    Icon(
                      Icons.open_in_new,
                      size: 10,
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text('Or have any ideas for improvement?'),
                    Text('Open a issue on Github.'),
                  ],
                ),
                onTap: () {
                  launchUrlString(
                    'https://github.com/realitymod/prspy_app/issues',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
