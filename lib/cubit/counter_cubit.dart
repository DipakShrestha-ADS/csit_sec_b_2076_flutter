import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    int lastState = state + 1;
    emit(lastState);
  }

  void decrement() {
    int lastState = state - 1;
    emit(lastState);
  }
}
