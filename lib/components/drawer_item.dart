import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class DrawerItem extends StatelessWidget {
  DrawerItem(
      {required this.itemIcon,
      required this.nameItem,
      required this.onPress});

  final String nameItem;
  final IconData itemIcon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: kBottomContainerColor,
      borderRadius: BorderRadius.circular(10),
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Row(
          spacing: 10.0,
          children: [
            Icon(itemIcon),
            Text(
              nameItem,
              style: kDrawerTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
