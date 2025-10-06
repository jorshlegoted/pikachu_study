part of 'pokemon_bloc.dart';

sealed class PokemonEvent {
  const PokemonEvent();
}

final class GetPokemonByNameEvent extends PokemonEvent {
  const GetPokemonByNameEvent({required this.name});
  final String name;
}

final class GetRandomPokemonEvent extends PokemonEvent {
  const GetRandomPokemonEvent({required this.id});
  final int id;
}