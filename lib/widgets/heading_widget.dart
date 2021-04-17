import 'package:flutter/material.dart';
import 'package:animeapidemo/consts.dart';

class Heading extends StatelessWidget {
  const Heading({
    Key key,
    @required this.leadingIcon,
    @required this.label,
  }) : super(key: key);

  final IconData leadingIcon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          leadingIcon,
          color: Consts.shade,
        ),
        SizedBox(width: 8),
        Text(
          label,
          textAlign: TextAlign.left,
          style: Consts.categoryHeading,
        ),
      ],
    );
  }
}
