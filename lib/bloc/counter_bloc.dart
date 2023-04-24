import 'package:first_project/bloc/counter_event.dart';
import 'package:first_project/bloc/coutern_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(EmptyCounterState()) {
    on<IncrementCounterEvent>(
      (event, emit) {
        int value = (state as SuccessState).value;
        emit(SuccessState(value: value++));
      },
    );
    on<DecrementCounterEvent>(
      (event, emit) {
        int value = event.value;
        value--;
        emit(SuccessState(value: value));
      },
    );
  }
}
