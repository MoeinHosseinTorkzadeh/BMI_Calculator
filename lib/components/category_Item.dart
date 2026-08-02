import 'package:flutter/material.dart';
import '../constants.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    required this.title,
    required this.details,
    this.onPress,
    this.isExpanded = false,
  });

  final String title;
  final String details;
  final VoidCallback? onPress;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: isExpanded,
      onExpansionChanged: (isExpanded) {
        if (isExpanded) {
          ///Using null aware operator we can fix the problem meaning that if there is function call if null do nothing
          onPress?.call();
        }
      },
      collapsedBackgroundColor: kActiveCardColor,
      collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)),
      childrenPadding: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(color: kInactiveCardColor)),
      backgroundColor: kBottomContainerColor,
      title: Text(
        title,
        style: kBMICategoriesTextStyle,
      ),
      children: [
        Text(
          details,
          textAlign: TextAlign.justify,
        )
      ],
    );
  }
}
