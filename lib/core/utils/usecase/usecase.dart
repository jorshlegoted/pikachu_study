import 'package:pikachi_dobre/core/core.dart';

abstract interface class UseCase<T, Params> {
  const UseCase();

  Future<Either<Failure, T>> call(Params params);
}

abstract interface class StreamUseCase<T, Params> {
  const StreamUseCase();

  Stream<Either<Failure, T>> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();
  
  @override
  List<Object> get props => [];
}