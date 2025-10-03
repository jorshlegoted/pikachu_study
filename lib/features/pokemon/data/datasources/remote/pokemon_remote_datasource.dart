import 'package:pikachi_dobre/features/pokemon/data/models/pokemon_model.dart';
import 'package:pikachi_dobre/features/pokemon/domain/usecases/get_pokemon_by_name.dart';

abstract interface class PokemonRemoteDatasource {
  Future<PokemonModel> getPokemonByName(GetPokemonByNameParams params);
  Future<PokemonModel> getRandomPokemon(int id);
}
