import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../constants/connection_type_enum.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivitySubscription;

  InternetCubit({required this.connectivity, this.connectivitySubscription})
      : super(InternetState()) {
    monitorSubscription();
  }

  StreamSubscription<ConnectivityResult> monitorSubscription() {
    return connectivitySubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.wifi);
      } else if (connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.mobileData);
      } else if (connectivityResult == ConnectivityResult.none) {
        emitInternetDisConnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisConnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
