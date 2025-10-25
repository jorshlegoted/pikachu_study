

import 'package:pikachi_dobre/core/core.dart';

abstract interface class ConnectionCheckerRepository {
  Stream<Either<Failure, InternetStatus>> onStatusChange();

  // [hasConnection] возвращает [Future] с результатом проверки подключения.
  Future<Either<Failure, bool>> get hasConnection;
}
