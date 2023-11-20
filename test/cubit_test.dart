import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_application/bloc/counter_cubit_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("counterCubit test", () {
    CounterCubitBloc counterCubit = CounterCubitBloc();

    setUp(() {
      counterCubit == CounterCubitBloc();
    });
    tearDown(() => counterCubit.close());

    test("test increment", () {
      expect(counterCubit.state, const CounterCubitState(counter: 0));
    });

    ///Increment function
    blocTest("test emits CounterState(counter:1, isIncremented:true)",
        build: () => CounterCubitBloc(),
        act: (cubit) => cubit.increment(),
        expect: () =>
            [const CounterCubitState(counter: 1, isIncremented: true)]);

    blocTest("Decrement",
        build: () => CounterCubitBloc(),
        act: (cubit) => cubit.decrement(),
        expect: () =>
            [const CounterCubitState(counter: -1, isIncremented: false)]);
  });

  ///decrement function
}
