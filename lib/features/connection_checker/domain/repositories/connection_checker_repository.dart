import 'package:either_dart/either.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:pikachi_dobre/core/utils/errors/failure.dart';

abstract interface class ConnectionCheckerRepository {
  Stream<Either<Failure, InternetStatus>> onStatusChange();

  // [hasConnection] возвращает [Future] с результатом проверки подключения.
  Future<Either<Failure, bool>> get hasConnection;
}
