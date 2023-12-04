import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_cubit_event.dart';
part 'counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(CounterCubitState(increment: 0));

  onClickIncrement() => emit(
      CounterCubitState(increment: state.increment + 1, wasIncremented: true));
  onClickDecrement() => emit(
      CounterCubitState(increment: state.increment - 1, wasIncremented: false));
}
