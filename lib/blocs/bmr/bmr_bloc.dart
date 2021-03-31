import 'dart:async';

import 'package:bloc/bloc.dart';
import 'bmr_event.dart';
import 'bmr_state.dart';

class BmrBloc extends Bloc<BmrEvent, BmrState> {
  static RegExp activityFactorRegex = RegExp(r".*(\d+.\d+).*");

  BmrBloc() : super(BmrInitial());

  @override
  Stream<BmrState> mapEventToState(BmrEvent event) async* {
    final weight = double.tryParse(event.weight);
    final height = double.tryParse(event.height);
    final age = double.tryParse(event.age);
    final regMatch = activityFactorRegex.firstMatch(event.activityFactor);
    final regGroup = regMatch?.group(1) ?? '';
    final activityFactor = double.tryParse(regGroup);
    if(weight == null) {
      yield BmrError("weight is not a number");
    }
    else if(height == null) {
      yield BmrError("height is not a number");
    }
    else if(age == null) {
      yield BmrError("age is not a number");
    }
    else if(activityFactor == null) {
      yield BmrError("activityFactor could not be parsed");
    }
    else if(event.isMale) {
      yield BmrResult((66+(13.7*(weight/2.2))+(5*(height*2.54))-(6.8*age)) * activityFactor);
    } else {
      yield BmrResult((655+(9.6*(weight/2.2))+(1.8*(height*2.54))-(4.7*age)) * activityFactor);
    }
  }
}
