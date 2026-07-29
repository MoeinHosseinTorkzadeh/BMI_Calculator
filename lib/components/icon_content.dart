import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final FaIconData genderIcon;
  final String genderLabel;

  IconContent({required this.genderLabel, required this.genderIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            genderIcon,
            size: 80.0,
          ),
          SizedBox(height: 15.0),
          Text(
            genderLabel,
            style: kLabelTextStyle,
          )
        ]);
  }
}
