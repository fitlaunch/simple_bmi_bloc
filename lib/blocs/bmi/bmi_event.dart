import 'package:flutter/cupertino.dart';

@immutable
class BmiEvent {
  final String weight;
  final String height;

  BmiEvent(this.weight, this.height);
}