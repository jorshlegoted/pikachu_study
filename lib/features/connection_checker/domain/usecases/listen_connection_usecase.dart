

import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';

final class ListenConnectionUsecase
    implements StreamUseCase<InternetStatus, NoParams> {
  ListenConnectionUsecase({required ConnectionCheckerRepository repository})
    : _repository = repository;

  final ConnectionCheckerRepository _repository;

  @override
  Stream<Either<Failure, InternetStatus>> call(NoParams params) =>
    _repository.onStatusChange();
}
