part of 'pokemon_bloc.dart';

sealed class PokemonEvent {
  const PokemonEvent();
}

final class GetPokemonByNameEvent extends PokemonEvent {
  const GetPokemonByNameEvent({required this.name, this.isFromSearch = false});
  final String name;
  final bool isFromSearch;
}

final class GetRandomPokemonEvent extends PokemonEvent {
  const GetRandomPokemonEvent();
}
