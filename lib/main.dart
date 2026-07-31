import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0XFF0a0e22),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0XFF0a0e22),
        ),
      ),
    );
  }
}
