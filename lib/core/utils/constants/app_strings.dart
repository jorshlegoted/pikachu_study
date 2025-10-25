part of 'app_constants.dart';

class AppStrings {
  const AppStrings._();

  String get appDatabase => 'app_database.db';

  String get pokemonTableName => 'pokemon';

  /// Ассеты изображений.
  String get background => 'assets/images/background.jpg';
  String get logo => 'assets/images/logo.png';

  /// Тексты кнопок.
  String get findPokemonButton => 'Найти покемона';
  String get randomPokemonButton => 'Случайный покемон';
  String get backButton => 'Назад';

  // Тексты полей
  String get pokemonNameField => 'Имя покемона';
  String get pokemonNameValidation => 'Пожалуйста, введите имя покемона';
  String get pokemonNameNumberValidation =>
      'Имя покемона не должно содержать цифры';

  /// Тексты экранов.
  String get pokemonNameLabel => 'Имя: ';
  String get baseExperienceLabel => 'Базовый опыт:';
  String get heightLabel => 'Рост:';
  String get weightLabel => 'Вес:';
  String get abilitiesLabel => 'Способности:';
  String get typesLabel => 'Типы:';

  /// Сообщения.
  String get noInternetConnectionMessage => 'Нет подключения к интернету';
  String get hasInternetConnectionMessage =>
      'Подключение к интернету восстановлено';
  String get noImageAvailable => 'Изображение недоступно';
  String get somethingWentWrongMessage => 'Что-то пошло не так';
}
