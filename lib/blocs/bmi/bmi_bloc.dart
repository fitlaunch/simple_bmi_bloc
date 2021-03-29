import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bmi_event.dart';
part 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(BmiInitial());

  @override
  Stream<BmiState> mapEventToState(
    BmiEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
