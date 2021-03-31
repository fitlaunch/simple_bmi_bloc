import 'package:flutter/material.dart';

@immutable
class BmrEvent {
  final String weight;
  final String height;
  final String age;
  final String activityFactor;
  final bool isMale;

  BmrEvent(this.weight, this.height, this.age, this.activityFactor, this.isMale);
}
