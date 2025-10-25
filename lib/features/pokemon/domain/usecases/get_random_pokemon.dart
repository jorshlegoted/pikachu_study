import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';

final class GetRandomPokemonUseCase
    implements UseCase<Pokemon, NoParams> {
  final PokemonRepository _repository;

  GetRandomPokemonUseCase({required PokemonRepository repository})
    : _repository = repository;

  @override
  Future<Either<Failure, Pokemon>> call(NoParams params) =>
      _repository.getRandomPokemon();
}
