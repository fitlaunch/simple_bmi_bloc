import 'package:flutter/material.dart';

class BmiDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My BMI'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '\$bmi', //whatever state result from bloc display here
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 15),
            Text(
              '\$bmi_result_detail', //whatever state result detail from bloc display here
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 15),
            Text(
              '\$bmr_result', //whatever state result detail from bloc display here
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
