import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/bmi_history_card_details.dart';
import '../database/bmi_model.dart';

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
  //Instead of a normal list we use BmiRecord model we built to make the work much more simple
  final List<BmiRecord> bmiRecords = [
    BmiRecord(
      bmi: 25.5,
      category: 'Normal Weight',
      height: 168.2,
      weight: 71.2,
      age: 21,
      gender: 'Male',
      date: '31 July 2026',
    ),
    BmiRecord(
      bmi: 22.4,
      category: 'Normal Weight',
      height: 180.0,
      weight: 72.2,
      age: 21,
      gender: 'Male',
      date: '30 July 2026',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bmiRecords.length,
      itemBuilder: (context, index) {
        return HistoryPageCardDetails(
            bmi: bmiRecords[index].bmi,
            category: bmiRecords[index].category,
            height: bmiRecords[index].height,
            weight: bmiRecords[index].weight,
            age: bmiRecords[index].age,
            date: bmiRecords[index].date,
            gender: bmiRecords[index].gender);
      },
    );
  }
}
