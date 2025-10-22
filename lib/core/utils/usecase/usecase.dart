import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:pikachi_dobre/core/utils/errors/failure.dart';

abstract interface class UseCase<Type, Params> {
  const UseCase();

  Future<Either<Failure, Type>> call(Params params);
}

abstract interface class StreamUseCase<Type, Params> {
  const StreamUseCase();

  Stream<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();
  
  @override
  List<Object> get props => [];
}