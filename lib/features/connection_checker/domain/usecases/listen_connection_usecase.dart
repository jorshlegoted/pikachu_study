import 'package:either_dart/src/either.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:pikachi_dobre/core/utils/errors/failure.dart';
import 'package:pikachi_dobre/core/utils/usecase/usecase.dart';
import 'package:pikachi_dobre/features/connection_checker/domain/repositories/connection_checker_repository.dart';

final class ListenConnectionUsecase
    implements StreamUseCase<InternetStatus, NoParams> {
  ListenConnectionUsecase({required ConnectionCheckerRepository repository})
    : _repository = repository;

  final ConnectionCheckerRepository _repository;

  @override
  Stream<Either<Failure, InternetStatus>> call(NoParams params) =>
    _repository.onStatusChange();
}
