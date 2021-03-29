part of 'bmr_bloc.dart';

abstract class BmrState extends Equatable {
  const BmrState();
}

class BmrInitial extends BmrState {
  @override
  List<Object> get props => [];
}
