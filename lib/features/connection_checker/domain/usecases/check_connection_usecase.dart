

import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';

final class CheckConnectionUsecase implements UseCase<bool, NoParams> {
  CheckConnectionUsecase({required ConnectionCheckerRepository repository})
    : _repository = repository;
  
  final ConnectionCheckerRepository _repository;

  @override
  Future<Either<Failure, bool>> call (NoParams params) =>
    _repository.hasConnection;
}
