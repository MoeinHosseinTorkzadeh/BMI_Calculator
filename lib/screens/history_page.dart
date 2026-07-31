import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/bmi_history_card_details.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BmiHistoryCard(),
      appBar: AppBar(
        title: Text(
          'BMI HISTORY',
        ),
      ),
    );
  }
}

class BmiHistoryCard extends StatelessWidget {
  const BmiHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        color: kInactiveCardColor,
        child: Column(
          spacing: 5,
          children: [
            HistoryPageCardDetails(
              bmi: 23.1,
              category: 'Normal Weight',
              height: 178,
              weight: 75,
              age: 29,
              gender: 'Male',
            ),
            HistoryPageCardDetails(
                bmi: 25,
                category: 'Normal Height',
                height: 180,
                weight: 72,
                age: 21,
                gender: 'Female'),
            HistoryPageCardDetails(
                bmi: 25,
                category: 'Normal Height',
                height: 180,
                weight: 72,
                age: 21,
                gender: 'Female')
          ],
        ),
      ),
    );
  }
}
