part of 'counter_cubit.dart';

class CounterCubitState extends Equatable {
  final int increment;
  bool wasIncremented;
  CounterCubitState({required this.increment, this.wasIncremented = false});

  @override
  List<Object> get props => [increment];
}
