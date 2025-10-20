import 'dart:convert';

import 'package:pikachi_dobre/core/database/app_database.dart';
import 'package:pikachi_dobre/core/utils/constants/app_strings.dart';
import 'package:pikachi_dobre/core/utils/errors/failure.dart';
import 'package:pikachi_dobre/features/pokemon/data/datasources/local/pokemon_local_datasource.dart';
import 'package:pikachi_dobre/features/pokemon/data/models/pokemon_model.dart';
import 'package:pikachi_dobre/features/pokemon/domain/usecases/get_pokemon_by_name.dart';

final class PokemonLocalDatasourceImpl implements PokemonLocalDatasource {
  final AppDatabase _database;

  PokemonLocalDatasourceImpl({required AppDatabase database})
    : _database = database;

  @override
  Future<void> writePokemon(PokemonModel pokemon) async {
    try {
      final db = await _database.database;
      final existing = await db.query(
        AppStrings.pokemonTableName,
        where: 'id = ?',
        whereArgs: [pokemon.id],
      );

      if (existing.isNotEmpty) {
        await db.update(
          AppStrings.pokemonTableName,
          pokemon.toJson(),
          where: 'id = ?',
          whereArgs: [pokemon.id],
        );
      } else {
        await db.insert(AppStrings.pokemonTableName, pokemon.toJson());
      }
    } catch (e) {
      throw SQFliteFailure(error: 'Ошибка при сохранении покемона: $e');
    }
  }

  @override
  Future<PokemonModel> getPokemonByName(GetPokemonByNameParams params) async {
    try {
      final db = await _database.database;

      final allPokemons = await db.query(AppStrings.pokemonTableName);
      print('All pokemons in DB: $allPokemons');

      final maps = await db.query(
        AppStrings.pokemonTableName,
        where: 'name = ?',
        whereArgs: [params.name],
      );

      if (maps.isNotEmpty) {
        final map = Map<String, dynamic>.from(maps.first);

        map['abilities'] = jsonDecode(map['abilities']) as List<dynamic>;
        map['sprites'] = jsonDecode(map['sprites']) as Map<String, dynamic>;
        map['types'] = jsonDecode(map['types']) as List<dynamic>;

        return PokemonModel.fromJson(map);
      } else {
        throw SQFliteFailure(
          error:
              'Покемон с именем ${params.name} не найден в локальной базе данных.',
        );
      }
    } catch (e) {
      throw SQFliteFailure(error: 'Ошибка при получении покемона: $e');
    }
  }

  @override
  Future<PokemonModel> getRandomPokemon(int id) async {
    try {
      final db = await _database.database;

      final maps = await db.query(
        AppStrings.pokemonTableName,
        where: 'name = ?',
        whereArgs: [id],
      );

      if (maps.isNotEmpty) {
        return PokemonModel.fromJson(maps.first);
      } else {
        throw SQFliteFailure(
          error: 'Покемон с именем $id не найден в локальной базе данных.',
        );
      }
    } catch (e) {
      throw SQFliteFailure(error: 'Ошибка при получении покемона: $e');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      final db = await _database.database;

      await db.delete(AppStrings.pokemonTableName);
    } catch (e) {
      throw SQFliteFailure(error: 'Ошибка при очистке кэша: $e');
    }
  }
}
