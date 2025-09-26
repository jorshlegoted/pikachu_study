import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:pikachi_dobre/core/utils/errors/failure.dart';
import 'package:pikachi_dobre/core/utils/usecase/usecase.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/pokemon.dart';
import 'package:pikachi_dobre/features/pokemon/domain/repositories/pokemon_repository.dart';

final class GetPokemonByName
    implements UseCase<Pokemon, GetPokemonByNameParams> {
  final PokemonRepository _repository;

  GetPokemonByName({required PokemonRepository repository})
    : _repository = repository;

  @override
  Future<Either<Failure, Pokemon>> call(GetPokemonByNameParams params) =>
      _repository.getPokemonByName(params);
}

class GetPokemonByNameParams extends Equatable {
  const GetPokemonByNameParams({required this.name});
  final String name;

  @override
  List<Object?> get props => throw UnimplementedError();
}
