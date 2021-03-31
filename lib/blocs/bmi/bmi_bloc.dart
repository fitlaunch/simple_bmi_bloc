import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'bmi_event.dart';
import 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(BmiInitial());

  @override
  Stream<BmiState> mapEventToState(BmiEvent event) async* {
    final weight = double.tryParse(event.weight);
    final height = double.tryParse(event.height);
    if(weight == null) {
      yield BmiError("weight is not a number");
    } else if(height == null) {
      yield BmiError("height is not a number");
    } else {
      final bmi = _calculateBmi(weight, height);
      yield BmiResult(
        bmi,
        _calculateBmiCategory(bmi)
      );
    }
  }

  // this is the calculation for bmi in emperical units.  metric conversion later.
  double _calculateBmi(double weight, double height) {
    return (weight / (height * height)) * 703;
  }

  // these are the detailed categories that will display along with the bmi number
  String _calculateBmiCategory(double bmi) {
    if (bmi == 0) {
      return 'Not Calculated';
    } else if (bmi < 18.5) {
      return 'UNDERWEIGHT';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'NORMAL';
    } else if (bmi >= 25 && bmi < 30) {
      return 'OVERWEIGHT';
    } else if (bmi >= 30 && bmi < 35) {
      return 'OBESE';
    } else {
      return 'EXTEREMELY OBESE';
    }
  }
}
