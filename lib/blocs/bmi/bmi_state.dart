import 'package:flutter/cupertino.dart';

@immutable
abstract class BmiState {}

class BmiInitial extends BmiState {}

class BmiResult extends BmiState {
  final double bmi;
  final String bmiCategory;

  BmiResult(this.bmi, this.bmiCategory);
}

class BmiError extends BmiState {
  final String error;

  BmiError(this.error);
}
