import 'package:either_dart/either.dart';
import 'package:pikachi_dobre/core/utils/errors/failure.dart';
import 'package:pikachi_dobre/core/utils/usecase/usecase.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/pokemon.dart';
import 'package:pikachi_dobre/features/pokemon/domain/repositories/pokemon_repository.dart';

final class GetRandomPokemon
    implements UseCase<Pokemon, NoParams> {
  final PokemonRepository _repository;

  GetRandomPokemon({required PokemonRepository repository})
    : _repository = repository;

  @override
  Future<Either<Failure, Pokemon>> call(NoParams params) =>
      _repository.getRandomPokemon();
}
