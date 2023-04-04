import 'package:flutter/material.dart';
import '../util/constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconContent({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 10.0),
        Text(
          text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
