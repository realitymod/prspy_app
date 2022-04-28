import 'package:flutter/material.dart';
import 'package:prspy/models/config.dart';

///
///
///
class CustomFilterOptions extends StatelessWidget {
  final Function() onFilterChanged;
  final Config _config = Config();

  ///
  ///
  ///
  CustomFilterOptions({
    required this.onFilterChanged,
    Key? key,
  }) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.filter_list_alt),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          child: Text(
            '${_config.hideEmptyServers ? 'Show' : 'Hide'} empty servers',
          ),
          onTap: () {
            _config.hideEmptyServers = !_config.hideEmptyServers;
            onFilterChanged();
          },
        ),
        PopupMenuItem<String>(
          child: Text(
            '${_config.hidePasswordedServers ? 'Show' : 'Hide'} passworded servers',
          ),
          onTap: () {
            _config.hidePasswordedServers = !_config.hidePasswordedServers;
            onFilterChanged();
          },
        ),
        PopupMenuItem<String>(
          child: Text(
            '${_config.hideCoopServers ? 'Show' : 'Hide'} Co-Op servers',
          ),
          onTap: () {
            _config.hideCoopServers = !_config.hideCoopServers;
            onFilterChanged();
          },
        ),
      ],
    );
  }
}
