class AppStrings {
  AppStrings._();

  static const appDatabase = 'app_database.db';

  static const pokemonTableName = 'pokemon';

  /// Ассеты изображений.
  static const background = 'assets/images/background.jpg';
  static const logo = 'assets/images/logo.png';

  /// Тексты кнопок.
  static const findPokemonButton = 'Найти покемона';
  static const randomPokemonButton = 'Случайный покемон';
  static const backButton = 'Назад';

  // Тексты полей
  static const pokemonNameField = 'Имя покемона';
  static const pokemonNameValidation = 'Пожалуйста, введите имя покемона';
  static const pokemonNameNumberValidation =
      'Имя покемона не должно содержать цифры';

  /// Тексты экранов.
  static const pokemonNameLabel = 'Имя: ';
  static const baseExperienceLabel = 'Базовый опыт:';
  static const heightLabel = 'Рост:';
  static const weightLabel = 'Вес:';
  static const abilitiesLabel = 'Способности:';
  static const typesLabel = 'Типы:';

  /// Сообщения.
  static const noInternetConnectionMessage = 'Нет подключения к интернету';
  static const hasInternetConnectionMessage =
      'Подключение к интернету восстановлено';
}
