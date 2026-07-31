import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class HistoryPageCardDetails extends StatelessWidget {
  HistoryPageCardDetails(
      {required this.bmi,
      required this.category,
      required this.height,
      required this.weight,
      required this.age,
      required this.gender,
      required this.date});

  final double bmi;
  final String category;
  final double height;
  final double weight;
  final int age;
  final String gender;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kActiveCardColor),
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Column(
            spacing: 15,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kHistoryBMIColor),
                      child: Column(
                        children: [
                          Text(
                            'BMI',
                            style: kHistoryPageBMIResultStyle,
                          ),
                          Text(
                            bmi.toString(),
                            style: kHistoryPageBMIResultNumberStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Text(category),
              IntrinsicHeight(
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      spacing: 3,
                      children: [
                        Icon(Icons.straighten),
                        Text('Height'),
                        Text('${height.toString()} cm')
                      ],
                    ),
                    VerticalDivider(),
                    Column(
                      spacing: 3,
                      children: [
                        Icon(Icons.scale),
                        Text('Weight'),
                        Text('${weight.toString()} kg')
                      ],
                    ),
                    VerticalDivider(),
                    Column(
                      spacing: 3,
                      children: [
                        Icon(Icons.cake),
                        Text('Age'),
                        Text('${age.toString()} yrs')
                      ],
                    ),
                    VerticalDivider(),
                    Column(
                      spacing: 3,
                      children: [
                        Icon(Icons.person),
                        Text('Gender'),
                        Text(gender)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            child: Text(date),
            top: 0,
            right: 0,
          )
        ],
      ),
    );
  }
}
