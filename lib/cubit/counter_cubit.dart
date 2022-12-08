import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState());

  void increment() {
    final count = state.count + 1;
    final updateState = CounterState(count: count);
    emit(updateState);
  }

  void decrement() {
    final count = state.count - 1;
    final updateState = CounterState(count: count);
    emit(updateState);
  }
}
