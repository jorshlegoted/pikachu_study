import 'dart:convert';


import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';


final class PokemonLocalDatasourceImpl implements PokemonLocalDatasource {
  final AppDatabase _database;

  PokemonLocalDatasourceImpl({required AppDatabase database})
    : _database = database;

  @override
  Future<void> writePokemon(PokemonModel pokemon) async {
    try {
      final db = await _database.database;
      final existing = await db.query(
        AppConstants.strings.pokemonTableName,
        where: 'id = ?',
        whereArgs: [pokemon.id],
      );

      if (existing.isNotEmpty) {
        await db.update(
          AppConstants.strings.pokemonTableName,
          pokemon.toJson(),
          where: 'id = ?',
          whereArgs: [pokemon.id],
        );
      } else {
        await db.insert(AppConstants.strings.pokemonTableName, pokemon.toJson());
      }
    } catch (e) {
      throw SQFliteFailure(error: 'Ошибка при сохранении покемона: $e');
    }
  }

  @override
  Future<PokemonModel> getPokemonByName(GetPokemonByNameParams params) async {
    try {
      final db = await _database.database;

      final allPokemons = await db.query(AppConstants.strings.pokemonTableName);
      print('All pokemons in DB: $allPokemons');

      final maps = await db.query(
        AppConstants.strings.pokemonTableName,
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
        AppConstants.strings.pokemonTableName,
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

      await db.delete(AppConstants.strings.pokemonTableName);
    } catch (e) {
      throw SQFliteFailure(error: 'Ошибка при очистке кэша: $e');
    }
  }
}
