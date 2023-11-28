import 'package:flutter/material.dart';
import 'package:flutter_application/bloc/bloc_learning_bloc.dart';
import 'package:flutter_application/bloc/counter_cubit_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_application/screens/second_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/routes.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ApplicationRoutes _appRoutes = ApplicationRoutes();
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
          onGenerateRoute: _appRoutes.onGeneratedRoute
          // home: BlocProvider<CounterCubitBloc>(
          //     create: (context) => CounterCubitBloc(), child: const HomeScreen()),
          ),
    );
  }

  @override
  void dispose() {
    _appRoutes.dispose();
    super.dispose();
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
          const SizedBox(height: 60),
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
                  content: Text("the count is incremented to ${state.counter}"),
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
                heroTag: null,
                onPressed: () {
                  BlocProvider.of<CounterCubitBloc>(context).increment();
                },
                tooltip: "Increment",
                backgroundColor: Colors.black,
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                heroTag: null,
                tooltip: "decrement",
                backgroundColor: Colors.black,
                onPressed: () {
                  BlocProvider.of<CounterCubitBloc>(context).decrement();
                },
                child: const Icon(Icons.remove),
              )
            ],
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/second');

                ///Anonymous routing
                // MaterialPageRoute(
                //   // builder: (_) => BlocProvider.value(
                //   //       value: BlocProvider.of<CounterCubitBloc>(context),
                //   //       child: const SecondScreen(
                //   //         title: "Welcome to second screen",
                //   //       ),
                //   //     ))
                //       );
              },
              child: const Text("go to second page")),
          const SizedBox(height: 15),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (_) => BlocProvider.value(
                //           value: BlocProvider.of<CounterCubitBloc>(context),
                //           child: const SecondScreen(
                //             title: "Welcome to Third screen",
                //           ),
                //         )));
              },
              child: const Text("go to Third page"))
        ],
      ),
    );
  }
}
