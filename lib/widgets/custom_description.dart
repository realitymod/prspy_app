import 'package:flutter/material.dart';

///
///
///
class CustomDescription extends StatelessWidget {
  final String label;
  final String value;

  ///
  ///
  ///
  const CustomDescription({
    required this.label,
    required this.value,
    Key? key,
  }) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            color: Colors.blueAccent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
