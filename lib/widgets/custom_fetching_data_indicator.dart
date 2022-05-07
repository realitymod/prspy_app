import 'package:flutter/material.dart';

///
///
///
class CustomFetchingDataIndicator extends StatelessWidget {
  final String message;

  ///
  ///
  ///
  const CustomFetchingDataIndicator({required this.message, Key? key})
      : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 75,
            width: 75,
            child: CircularProgressIndicator.adaptive(),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(message),
          ),
        ],
      ),
    );
  }
}
