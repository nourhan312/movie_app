import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_check__state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity _connectivity = Connectivity();

  ConnectivityCubit() : super(ConnectivityInitial()) {
    _checkInitialConnectivity();
    _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        emit(ConnectivityDisconnected());
      } else {
        emit(ConnectivityConnected());
      }
    });
  }

  void _checkInitialConnectivity() async {
    var result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      emit(ConnectivityDisconnected());
    } else {
      emit(ConnectivityConnected());
    }
  }
}
