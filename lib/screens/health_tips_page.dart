import 'package:flutter/material.dart';
import '../components/category_Item.dart';
import '../components/health_tips_dictionary.dart';
import '../constants.dart';

class HealthTipsPage extends StatefulWidget {
  @override
  State<HealthTipsPage> createState() => _HealthTipsPageState();
}

class _HealthTipsPageState extends State<HealthTipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HEALTH TIPS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            SearchBar(
              leading: const Icon(Icons.search),
              backgroundColor:
                  WidgetStateProperty.all(kBottomContainerColor),
              padding: WidgetStateProperty.all(
                EdgeInsets.all(10),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CategoryItem(
              title: healthTips.keys.elementAt(0),
              details: healthTips.values.elementAt(0),
            ),
            SizedBox(
              height: 20,
            ),
            CategoryItem(
              title: healthTips.keys.elementAt(1),
              details: healthTips.values.elementAt(1),
            ),
            SizedBox(
              height: 20,
            ),
            CategoryItem(
              title: healthTips.keys.elementAt(2),
              details: healthTips.values.elementAt(2),
            ),
            SizedBox(
              height: 20,
            ),
            CategoryItem(
              title: healthTips.keys.elementAt(3),
              details: healthTips.values.elementAt(3),
            ),
            SizedBox(
              height: 20,
            ),
            CategoryItem(
              title: healthTips.keys.elementAt(4),
              details: healthTips.values.elementAt(4),
            ),
            SizedBox(
              height: 20,
            ),
            CategoryItem(
              title: healthTips.keys.elementAt(5),
              details: healthTips.values.elementAt(5),
            )
          ],
        ),
      ),
    );
  }
}
