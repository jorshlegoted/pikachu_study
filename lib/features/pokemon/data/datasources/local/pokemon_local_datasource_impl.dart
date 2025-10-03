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
  Future<PokemonModel> getPokemonByName(GetPokemonByNameParams params) async {
    try {
      final db = await _database.database;

      final maps = await db.query(
        AppStrings.pokemonDatabaseName,
        where: 'name = ?',
        whereArgs: [params.name],
      );

      if (maps.isNotEmpty) {
        return PokemonModel.fromJson(maps.first);
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
        AppStrings.pokemonDatabaseName,
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

      await db.delete(AppStrings.pokemonDatabaseName);
    } catch (e) {
      throw SQFliteFailure(error: 'Ошибка при очистке кэша: $e');
    }
  }

  @override
  Future<void> writePokemon(PokemonModel pokemon) async {
    try {
      final db = await _database.database;

      await db.insert(AppStrings.pokemonDatabaseName, pokemon.toJson());
    } catch (e) {
      throw SQFliteFailure(error: 'Ошибка при сохранении покемона: $e');
    }
  }
}
