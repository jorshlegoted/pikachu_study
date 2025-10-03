import 'package:dio/dio.dart';
import 'package:pikachi_dobre/core/utils/constants/api_keys.dart';
import 'package:pikachi_dobre/features/pokemon/data/datasources/remote/pokemon_remote_datasource.dart';
import 'package:pikachi_dobre/features/pokemon/data/models/pokemon_model.dart';
import 'package:pikachi_dobre/features/pokemon/domain/usecases/get_pokemon_by_name.dart';

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
