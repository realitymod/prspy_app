import 'package:flutter/material.dart';

///
///
///
class CustomFetchingDataIndicator extends StatelessWidget {
  ///
  ///
  ///
  const CustomFetchingDataIndicator({Key? key}) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          SizedBox(
            height: 75,
            width: 75,
            child: CircularProgressIndicator.adaptive(),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('Fetching servers'),
          ),
        ],
      ),
    );
  }
}
