import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/database/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/bmi_history_card_details.dart';
import '../database/bmi_model.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BmiHistoryCard(),
      appBar: AppBar(
        title: const Text(
          'BMI HISTORY',
        ),
      ),
    );
  }
}

class BmiHistoryCard extends StatelessWidget {
  //Instead of a normal list we use BmiRecord model we built to make the work much more simple

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BmiRecord>>(
      //since instance is global variable and belongs to the DatabaseHelper class we need to name DatabaseHelper class whenever we wanna use instance
      future: DatabaseHelper.instance.getAllBMIRecords(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error ${snapshot.error}'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasData) {
          final records = snapshot.data!;
          if (records.isEmpty) {
            return const Center(
              child: Text('No Records!'),
            );
          } else {
            return ListView.builder(
              itemCount: records.length,
              itemBuilder: (context, index) {
                return HistoryPageCardDetails(
                  bmi: records[index].bmi,
                  category: records[index].category,
                  height: records[index].height,
                  weight: records[index].weight,
                  age: records[index].age,
                  date: records[index].date,
                  gender: records[index].gender,
                );
              },
            );
          }
        }

        return const Center(
          child: Text('No BMI records found.'),
        );
      },
    );
  }
}
