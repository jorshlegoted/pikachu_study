import 'package:either_dart/either.dart';
import 'package:pikachi_dobre/core/utils/errors/failure.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/pokemon.dart';
import 'package:pikachi_dobre/features/pokemon/domain/usecases/get_pokemon_by_name.dart';

abstract interface class PokemonRepository {
  Future<Either<Failure, Pokemon>> getPokemonByName(
    GetPokemonByNameParams params,
  );
  Future<Either<Failure, Pokemon>> getRandomPokemon();
}
