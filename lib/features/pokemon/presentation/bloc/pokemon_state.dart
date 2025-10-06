part of 'pokemon_bloc.dart';

sealed class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object?> get props => [];
}

final class PokemonLoading extends PokemonState {
  const PokemonLoading();
}

final class PokemonLoaded extends PokemonState {
  const PokemonLoaded({required this.pokemon});
  final Pokemon pokemon;

  @override
  List<Object> get props => [pokemon];
}

final class PokemonError extends PokemonState {
  const PokemonError({this.message});
  final String? message;

  @override
  List<Object?> get props => [message];
}