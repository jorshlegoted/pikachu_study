

import 'package:pikachi_dobre/features/features.dart';

abstract interface class PokemonLocalDatasource {
  Future<void> writePokemon(PokemonModel pokemon);
  Future<PokemonModel> getPokemonByName(GetPokemonByNameParams params);
  Future<PokemonModel> getRandomPokemon(int id);
  Future<void> clearCache();
}
