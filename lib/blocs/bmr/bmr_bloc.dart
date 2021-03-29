import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bmr_event.dart';
part 'bmr_state.dart';

class BmrBloc extends Bloc<BmrEvent, BmrState> {
  BmrBloc() : super(BmrInitial());

  @override
  Stream<BmrState> mapEventToState(
    BmrEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
