import 'package:either_dart/src/either.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:pikachi_dobre/core/utils/errors/failure.dart';
import 'package:pikachi_dobre/core/utils/handlers/network_info.dart';
import 'package:pikachi_dobre/features/connection_checker/domain/repositories/connection_checker_repository.dart';

final class ConnectionCheckerRepositoryImpl
    implements ConnectionCheckerRepository {
  ConnectionCheckerRepositoryImpl({required NetworkInfo networkInfo})
    : _networkInfo = networkInfo;

  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, bool>> get hasConnection async {
    try {
      final hasConnection = await _networkInfo.hasConnection;
      return Right(hasConnection);
    } on Exception catch (e) {
      return Left(ConnectionFailure(error: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, InternetStatus>> onStatusChange() {
    try {
      return _networkInfo.onStatusChange().map((status) => Right(status));
    } on Exception catch (e) {
      return Stream.value(Left(ConnectionFailure(error: e.toString())));
    }
  }
}
