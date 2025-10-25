import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';

abstract interface class PokemonRepository {
  Future<Either<Failure, Pokemon>> getPokemonByName(
    GetPokemonByNameParams params,
  );
  Future<Either<Failure, Pokemon>> getRandomPokemon();
}
