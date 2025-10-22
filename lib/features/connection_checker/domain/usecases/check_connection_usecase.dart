import 'package:either_dart/either.dart';
import 'package:pikachi_dobre/core/utils/errors/failure.dart';
import 'package:pikachi_dobre/core/utils/usecase/usecase.dart';
import 'package:pikachi_dobre/features/connection_checker/domain/repositories/connection_checker_repository.dart';

final class CheckConnectionUsecase implements UseCase<bool, NoParams> {
  CheckConnectionUsecase({required ConnectionCheckerRepository repository})
    : _repository = repository;
  
  final ConnectionCheckerRepository _repository;

  @override
  Future<Either<Failure, bool>> call (NoParams params) =>
    _repository.hasConnection;
}
