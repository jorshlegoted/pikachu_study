import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:pikachi_dobre/core/database/app_database.dart';
import 'package:pikachi_dobre/core/utils/constants/api_keys.dart';
import 'package:pikachi_dobre/core/utils/handlers/network_info.dart';
import 'package:pikachi_dobre/features/pokemon/data/datasources/local/pokemon_local_datasource.dart';
import 'package:pikachi_dobre/features/pokemon/data/datasources/local/pokemon_local_datasource_impl.dart';
import 'package:pikachi_dobre/features/pokemon/data/datasources/remote/pokemon_remote_datasource.dart';
import 'package:pikachi_dobre/features/pokemon/data/datasources/remote/pokemon_remote_datasource_impl.dart';
import 'package:pikachi_dobre/features/pokemon/data/datasources/repositories/pokemon_repository_impl.dart';
import 'package:pikachi_dobre/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pikachi_dobre/features/pokemon/domain/usecases/get_pokemon_by_name.dart';
import 'package:pikachi_dobre/features/pokemon/domain/usecases/get_random_pokemon.dart';
import 'package:pikachi_dobre/features/pokemon/presentation/bloc/pokemon_bloc.dart';

// Сервис локатор
final sl = GetIt.instance;
late final AppDatabase _database;
late final Dio _dio;
late final InternetConnection _connectionChecker;
late final NetworkInfo _networkInfo;

Future<void> initDependencyInjection() async {
  _dio = Dio();
  BaseOptions(
    baseUrl: ApiKeys.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  );

  _connectionChecker = InternetConnection();

  sl
    // Утилиты.
    ..registerLazySingleton<Dio>(() => _dio)
    ..registerLazySingleton<AppDatabase>(() => _database)
    ..registerLazySingleton(() => _connectionChecker)
    ..registerLazySingleton<NetworkInfo>(() => _networkInfo);

  _database = AppDatabase.instance;
  _networkInfo = NetworkInfoImpl(connectionChecker: sl());

  // Инициализация покемонов.
  _initPokemon();
}

void _initPokemon() {
  sl
    // Blocs
    ..registerFactory<PokemonBloc>(
      () => PokemonBloc(
        getPokemonByNameUseCase: sl(),
        getRandomPokemonUseCase: sl(),
      ),
    )
    // UseCases.
    ..registerLazySingleton<GetPokemonByNameUseCase>(
      () => GetPokemonByNameUseCase(repository: sl()),
    )
    ..registerLazySingleton<GetRandomPokemonUseCase>(
      () => GetRandomPokemonUseCase(repository: sl()),
    )
    // Repositories.
    ..registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImpl(
        remoteDatasource: sl(),
        localDatasource: sl(),
        networkInfo: sl(),
      ),
    )
    // Datasources
    ..registerLazySingleton<PokemonRemoteDatasource>(
      () => PokemonRemoteDatasourceImpl(dio: sl()),
    )
    ..registerLazySingleton<PokemonLocalDatasource>(
      () => PokemonLocalDatasourceImpl(database: sl()),
    );
}
