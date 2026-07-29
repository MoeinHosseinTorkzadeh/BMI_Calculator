import 'package:flutter/material.dart';

// When we use required keyword null safety does not give error
class ReusableCard extends StatelessWidget {
  ReusableCard({required this.color, this.cardChild, this.onPress});

  final Color color;
  final Widget? cardChild;
  final VoidCallback?
      onPress; //VoidCallback is still a function that returns nothing
  //in the recent versions of flutter to be in the safe side we need to
  // especially mention the exact type of function so instead using Function we use this

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
    );
  }
}
