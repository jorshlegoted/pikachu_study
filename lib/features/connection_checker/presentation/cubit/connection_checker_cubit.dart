
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';

part 'connection_checker_state.dart';

class ConnectionCheckerCubit extends Cubit<ConnectionCheckerState> {
  ConnectionCheckerCubit({
    required ListenConnectionUsecase listenConnectionUsecase,
  }) : _listenConnectionUsecase = listenConnectionUsecase,
       super(const ConnectionCheckerState());

  final ListenConnectionUsecase _listenConnectionUsecase;

  void startListening() {
    _listenConnectionUsecase.call(NoParams()).listen((either) {
      either.fold(
        (failure) {
          emit(ConnectionCheckerState(hasConnection: false));
        },
        (status) {
          final hasConnection = status == InternetStatus.connected;
          emit(ConnectionCheckerState(hasConnection: hasConnection));
        },
      );
    });
  }
}
