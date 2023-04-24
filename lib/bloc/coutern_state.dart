import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {}

class EmptyCounterState extends CounterState {
  final int value;
  EmptyCounterState({this.value = 0});
  @override
  List<Object?> get props => [value];
}

class SuccessState extends CounterState {
  final int value;
  SuccessState({required this.value});

  @override
  List<Object?> get props => [value];
}
