import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:emanpanel/bloc/connectivity_bloc/connectivity_event.dart';
import 'package:emanpanel/bloc/connectivity_bloc/connectivity_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityBloc extends Bloc<ConnectionEvent, ConnectivityState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? _streamSubscription;
  ConnectivityBloc() : super(ConnectionInitialState()) {
    on<ConnectionLostEvent>((event, emit) => emit(ConnectionLostState()));
    on<ConnectionGainedEvent>((event, emit) => emit(ConnectionGainedState()));
    _streamSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        add(ConnectionGainedEvent());
      } else {
        add(ConnectionLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    _streamSubscription!.cancel();
    return super.close();
  }
}
