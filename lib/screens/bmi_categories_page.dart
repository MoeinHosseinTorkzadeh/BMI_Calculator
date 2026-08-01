import 'package:bmi_calculator/constants.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import '../components/category_Item.dart';

class BmiCategoriesPage extends StatefulWidget {
  @override
  State<BmiCategoriesPage> createState() => _BmiCategoriesPageState();
}

class _BmiCategoriesPageState extends State<BmiCategoriesPage> {
  double _selectedProgress = 25;
  String _displayText = '25';
  double _maximumProgress = 35;

  ///Responsible for changing the progress by clicking on ExpansionTiles
  void _alterProgress(double progress, String progressText) {
    setState(() {
      _selectedProgress = progress;
      _displayText = progressText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CATEGORIES'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: ListView(
          children: [
            Card(
              elevation: 4,
              color: kActiveCardColor,
              child: Align(
                alignment: Alignment.topCenter,
                child: DashedCircularProgressBar(
                  child: Center(
                    child: Text(
                      _displayText,
                      style: kProgressBarNumberStyle,
                    ),
                  ),
                  width: 350,
                  height: 370,
                  foregroundColor: kBottomContainerColor,
                  progress: _selectedProgress,
                  maxProgress: _maximumProgress,
                  animation: true,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CategoryItem(
              onPress: () => _alterProgress(17.5, '17.5'),
              title: 'Underweight',
              details:
                  'Your body weight is low in relation to your height.'
                  ' This indicates that your energy intake (calories consumed)'
                  ' might be lower than your energy output (calories used), '
                  'leading to possible nutrient deficiencies.',
            ),
            SizedBox(
              height: 20,
            ),
            CategoryItem(
                onPress: () => _alterProgress(21.5, '21.5'),
                title: 'Normal Weight',
                details:
                    'Your weight is generally considered appropriate for your height.'
                    ' Most healthy adults fall within this range.'),
            SizedBox(
              height: 20,
            ),
            CategoryItem(
                onPress: () => _alterProgress(27.5, '27.5'),
                title: 'Overweight',
                details:
                    'You are carrying more weight than is considered healthy for your height.'
                    ' This often suggests that your body fat percentage is elevated.'
                    ' It is a warning sign to make lifestyle adjustments to prevent further weight gain.'),
            SizedBox(
              height: 20,
            ),
            CategoryItem(
                onPress: () => _alterProgress(32.5, '32.5'),
                title: 'Obesity',
                details:
                    'You have a significantly high amount of body weight and body fat in relation to your height.'
                    ' Obesity is a chronic medical condition that significantly increases the risk of numerous other health problems.')
          ],
        ),
      ),
    );
  }
}
