import 'package:bloc_updates/logic/bloc/counter_cubit.dart';
import 'package:bloc_updates/logic/bloc/cubit/internet_cubit.dart';
import 'package:bloc_updates/routes/app_router.dart';
import 'package:bloc_updates/screens/home_screen.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    appRoute: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRoute;
  final Connectivity connectivity;

  const MyApp({
    Key? key,
    required this.appRoute,
    required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
            create: (internetCubitContext) =>
                InternetCubit(connectivity: connectivity)),
        BlocProvider(create: (counterCubitContext) => CounterCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: appRoute.onGeneratedRoute,
      ),
    );
  }
}
