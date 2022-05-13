import 'package:flutter/material.dart';

///
///
///
class CustomDescription extends StatelessWidget {
  final String label;
  final String value;
  final TextAlign? valueTextAlign;
  final EdgeInsets? valuePadding;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  ///
  ///
  ///
  const CustomDescription({
    required this.label,
    required this.value,
    this.valueTextAlign,
    this.valuePadding,
    this.labelStyle,
    this.valueStyle,
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
          style: labelStyle ??
              const TextStyle(
                color: Colors.blueAccent,
              ),
        ),
        Padding(
          padding: valuePadding ?? const EdgeInsets.only(left: 8),
          child: Text(
            value,
            textAlign: valueTextAlign,
            style: valueStyle ??
                const TextStyle(
                  fontSize: 14,
                ),
          ),
        ),
      ],
    );
  }
}
