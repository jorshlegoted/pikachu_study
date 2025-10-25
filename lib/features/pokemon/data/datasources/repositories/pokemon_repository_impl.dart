import 'dart:math';
import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';


final class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDatasource _remoteDatasource;
  final PokemonLocalDatasource _localDatasource;
  final NetworkInfo _networkInfo;

  PokemonRepositoryImpl({
    required PokemonRemoteDatasource remoteDatasource,
    required PokemonLocalDatasource localDatasource,
    required NetworkInfo networkInfo,
  }) : _remoteDatasource = remoteDatasource,
       _localDatasource = localDatasource,
       _networkInfo = networkInfo;

  @override
  Future<Either<Failure, Pokemon>> getPokemonByName(
    GetPokemonByNameParams params,
  ) async {
    try {
      final hasConnection = await _networkInfo.hasConnection;
      PokemonModel? pokemon;

      if (hasConnection) {
        pokemon = await _remoteDatasource.getPokemonByName(params);
        await _localDatasource.writePokemon(pokemon);

        return Right(pokemon);
      } else {
        pokemon = await _localDatasource.getPokemonByName(params);
        return Right(pokemon);
      }
    } catch (e) {
      return Left(PokemonFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getRandomPokemon() async {
    try {
      final random = Random();
      final id = random.nextInt(1025) + 1;
      final hasConnection = await _networkInfo.hasConnection;
      PokemonModel? pokemon;

      if (hasConnection) {
        pokemon = await _remoteDatasource.getRandomPokemon(id);
        await _localDatasource.writePokemon(pokemon);

        return Right(pokemon);
      } else {
        pokemon = await _localDatasource.getRandomPokemon(id);
        return Right(pokemon);
      }

    } catch (e) {
      return Left(PokemonFailure(error: e.toString()));
    }
  }
}
