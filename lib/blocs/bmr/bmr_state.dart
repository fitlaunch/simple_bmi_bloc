import 'package:flutter/cupertino.dart';

@immutable
abstract class BmrState {}

class BmrInitial extends BmrState {}

class BmrResult extends BmrState {
  final double bmr;

  BmrResult(this.bmr);
}

class BmrError extends BmrState {
  final String error;

  BmrError(this.error);
}
