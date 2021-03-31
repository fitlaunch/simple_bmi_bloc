import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bmi/bmi_bloc.dart';
import '../blocs/bmi/bmi_state.dart';
import '../blocs/bmr/bmr_bloc.dart';
import '../blocs/bmr/bmr_state.dart';

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
            BlocBuilder<BmiBloc, BmiState>(
              builder: (context, state) {
                if(state is BmiResult) {
                  return Text(
                    '${state.bmi}', //whatever state result from bloc display here
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  );
                } else if(state is BmiError) {
                  return Text(
                    'Could not calculate bmi: ${state.error}', //whatever state result from bloc display here
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  );
                } else {
                  return Text(
                    'Calculating bmi...', //whatever state result from bloc display here
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  );
                }
              }
            ),
            SizedBox(height: 15),
            BlocBuilder<BmiBloc, BmiState>(
              builder: (context, state) {
                if(state is BmiResult) {
                  return Text(
                    '${state.bmiCategory}', //whatever state result detail from bloc display here
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.purple,
                    ),
                  );
                } else if(state is BmiError) {
                  return Text(
                    'Could not calculate bmi details: ${state.error}', //whatever state result from bloc display here
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  );
                } else {
                  return Text(
                    'Calculating bmi details...', //whatever state result from bloc display here
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  );
                }
              }
            ),
            SizedBox(height: 15),
            BlocBuilder<BmrBloc, BmrState>(
              builder: (context, state) {
                if(state is BmrResult) {
                  return Text(
                    '${state.bmr}', //whatever state result detail from bloc display here
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.purple,
                    ),
                  );
                } else if(state is BmrError) {
                  return Text(
                    'Could not calculate bmr: ${state.error}', //whatever state result from bloc display here
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  );
                } else {
                  return Text(
                    'Calculating bmr...', //whatever state result from bloc display here
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  );
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}
