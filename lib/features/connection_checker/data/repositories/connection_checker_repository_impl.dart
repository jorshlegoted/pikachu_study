
import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';


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
