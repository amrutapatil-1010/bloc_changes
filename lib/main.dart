import 'package:flutter/material.dart';
import 'package:flutter_application/bloc/bloc_learning_bloc.dart';
import 'package:flutter_application/bloc/counter_cubit_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() {
  CounterCubitState counter1 = const CounterCubitState(counter: 0);
  CounterCubitState counter2 = const CounterCubitState(counter: 0);
  print(counter1 == counter2);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubitBloc(),
      child: MaterialApp(
        title: "flutter demo",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("flutter demo 1"),
        ),
        body:
            // BlocListener<CounterCubitBloc, CounterCubitState>(
            //     listener: (context, state) {
            //       if (state.isIncremented!) {
            //         ScaffoldMessenger.of(context).showSnackBar(
            //           SnackBar(
            //             content:
            //                 Text("the count is incremented to ${state.counter}"),
            //             duration: const Duration(milliseconds: 1000),
            //           ),
            //         );
            //       } else if (state.isIncremented == false) {
            //         ScaffoldMessenger.of(context).showSnackBar(
            //           SnackBar(
            //             content:
            //                 Text("the  count is decremented to ${state.counter}"),
            //             duration: const Duration(milliseconds: 1000),
            //           ),
            //         );
            //       }
            //     },child: Column();

            Column(
          children: [
            const Text("You have pushed button these any times..."),
            //Bloc Consumer - Combination of blocBuilder and blocListener
            BlocConsumer<CounterCubitBloc, CounterCubitState>(
                builder: (context, state) {
              if (state.counter == 3) {
                return Text("Counter value  increased 10%..${state.counter}");
              }
              return Text("Successively increased ${state.counter}");
            }, listener: ((context, state) {
              if (state.isIncremented!) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text("the count is incremented to ${state.counter}"),
                    duration: const Duration(milliseconds: 1000),
                  ),
                );
              } else if (state.isIncremented == false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text("the  count is decremented to ${state.counter}"),
                    duration: const Duration(milliseconds: 1000),
                  ),
                );
              }
            })),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubitBloc>(context).increment();
                  },
                  tooltip: "Increment",
                  backgroundColor: Colors.black,
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  tooltip: "decrement",
                  backgroundColor: Colors.black,
                  onPressed: () {
                    BlocProvider.of<CounterCubitBloc>(context).decrement();
                  },
                  child: const Icon(Icons.remove),
                )
              ],
            )
          ],
        ));
  }
}
