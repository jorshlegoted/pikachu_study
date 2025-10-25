import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';

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

  // Инициализация проверки соединени
  _initConnectionChecker();
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

void _initConnectionChecker() {
  sl
    // Cubits.
    ..registerFactory<ConnectionCheckerCubit>(
      () => ConnectionCheckerCubit(listenConnectionUsecase: sl()),
    )
    // UseCases.
    ..registerLazySingleton<ListenConnectionUsecase>(
      () => ListenConnectionUsecase(repository: sl()),
    )
    // Repositories
    ..registerLazySingleton<ConnectionCheckerRepository>(
      () => ConnectionCheckerRepositoryImpl(networkInfo: sl()),
    );
}
