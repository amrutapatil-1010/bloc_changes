import 'package:bloc_updates/constants/connection_type_enum.dart';
import 'package:bloc_updates/logic/bloc/counter_cubit.dart';
import 'package:bloc_updates/logic/bloc/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({required this.title, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<InternetCubit, InternetState>(
                builder: (internetCubitContext, state) {
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.wifi) {
                return Text(
                  "Wi-Fi",
                  style: Theme.of(internetCubitContext)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                        color: Colors.green,
                      ),
                );
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.mobileData) {
                return Text(
                  "Mobile data",
                  style: Theme.of(internetCubitContext)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.deepOrange),
                );
              }
              return const CircularProgressIndicator();
              // return Text("disconnected",
              //     style: Theme.of(internetCubitContext)
              //         .textTheme
              //         .bodyMedium
              //         ?.copyWith(color: Colors.red));
            }),
            const Divider(
              height: 5,
            ),
            BlocConsumer<CounterCubit, CounterCubitState>(
              listener: (counterCubitContext, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(counterCubitContext).showSnackBar(SnackBar(
                      content: Text(
                          "The increment is done.. with the value ${state.increment}")));
                } else if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(counterCubitContext).showSnackBar(SnackBar(
                      content: Text(
                          "the decrement is done..with value ${state.increment}")));
                }
              },
              builder: (counterCubitContext, state) {
                if (state.increment < 0) {
                  return Text(
                    "the value is negative... ${state.increment}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.blue),
                  );
                } else if (state.increment == 0) {
                  return Text(
                    "The value is Zero...${state.increment}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.pink),
                  );
                } else if (state.increment == 5) {
                  return Text(
                    "The value is ${state.increment}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.purple),
                  );
                } else {
                  return Text(
                    "The value is positive...${state.increment}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.orangeAccent),
                  );
                }
              },
            ),
            const SizedBox(
              height: 4,
            ),
            Builder(builder: (context) {
              final counterState = context.watch<CounterCubit>().state;
              final internetState = context.watch<InternetCubit>().state;

              if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.wifi) {
                return Text(
                    "Counter: ${counterState.increment}, The data type is ${internetState.connectionType}");
              } else if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.mobileData) {
                return Text(
                    "Counter : ${counterState.increment}, The data is type is ${internetState.connectionType}");
              } else {
                return Text(
                    "Counter: ${counterState.increment}, The internet is disconnected");
              }
            }),
            const SizedBox(
              height: 10,
            ),
            Builder(builder: (context) {
              final counterValue = context.select(
                (CounterCubit value) => value.state.increment,
              );
              return Text("Counter: $counterValue");
            }),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).onClickIncrement();
                  },
                  tooltip: "Increment",
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).onClickDecrement();
                  },
                  tooltip: "Decrement",
                  child: const Icon(Icons.remove),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
