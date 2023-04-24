import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {}

class IncrementCounterEvent extends CounterEvent {
  final int value;
  IncrementCounterEvent({required this.value});

  @override
  List<Object?> get props => [value];
}

class DecrementCounterEvent extends CounterEvent {
  final int value;
  DecrementCounterEvent({required this.value});

  @override
  List<Object?> get props => [value];
}
