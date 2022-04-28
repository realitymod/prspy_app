import 'package:flutter/material.dart';

///
///
///
class CustomDescription extends StatelessWidget {
  final String label;
  final String value;
  final TextAlign? valueTextAlign;

  ///
  ///
  ///
  const CustomDescription({
    required this.label,
    required this.value,
    this.valueTextAlign,
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
          style: const TextStyle(
            color: Colors.blueAccent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            value,
            textAlign: valueTextAlign,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
