import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';


final class PokemonRemoteDatasourceImpl implements PokemonRemoteDatasource {
  final Dio _dio;

  PokemonRemoteDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<PokemonModel> getPokemonByName(GetPokemonByNameParams params) async {
    try {
      final response = await _dio.get(ApiKeys.getPokemonByName(params.name));
      if (response.statusCode == 200) {
        return PokemonModel.fromJson(response.data as Map<String, dynamic>);
      }
      throw Exception('Failed to load pokemon: ${response.statusCode}');
    } catch (e) {
      throw Exception('Failed to load pokemon: $e');
    }
  }

  @override
  Future<PokemonModel> getRandomPokemon(int id) async {
    try {
      final response = await _dio.get(ApiKeys.getRandomPokemonEndpoint(id));
      if (response.statusCode == 200) {
        return PokemonModel.fromJson(response.data as Map<String, dynamic>);
      }
      throw Exception('Failed to load pokemon: ${response.statusCode}');
    } catch (e) {
      throw Exception('Failed to load pokemon: $e');
    }
  }
}
