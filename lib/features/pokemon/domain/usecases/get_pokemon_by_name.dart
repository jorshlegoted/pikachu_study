import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';

final class GetPokemonByNameUseCase
    implements UseCase<Pokemon, GetPokemonByNameParams> {
  final PokemonRepository _repository;

  GetPokemonByNameUseCase({required PokemonRepository repository})
    : _repository = repository;

  @override
  Future<Either<Failure, Pokemon>> call(GetPokemonByNameParams params) =>
      _repository.getPokemonByName(params);
}

class GetPokemonByNameParams extends Equatable {
  const GetPokemonByNameParams({required this.name});
  final String name;

  @override
  List<Object?> get props => [name];
}
