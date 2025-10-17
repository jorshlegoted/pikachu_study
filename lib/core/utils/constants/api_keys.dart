abstract class ApiKeys {
  ApiKeys._();


  // базовый URL для API покемонов
  static const baseUrl = 'https://pokeapi.co/api/v2';

  // ! ========================= POKEMON ==================== ! //
  static String getPokemonByName(String name) => '$baseUrl/pokemon/$name';

  static String getRandomPokemonEndpoint(int id) => '$baseUrl/pokemon/$id';
}