import 'package:pikachi_dobre/features/features.dart';

abstract interface class PokemonRemoteDatasource {
  Future<PokemonModel> getPokemonByName(GetPokemonByNameParams params);
  Future<PokemonModel> getRandomPokemon(int id);
}
