import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'counter_cubit_event.dart';
part 'counter_cubit_state.dart';

class CounterCubitBloc extends Cubit<CounterCubitState> {
  CounterCubitBloc() : super(const CounterCubitState(counter: 0));
  void increment() =>
      emit(CounterCubitState(counter: state.counter + 1, isIncremented: true));
  void decrement() =>
      emit(CounterCubitState(counter: state.counter - 1, isIncremented: false));
}
