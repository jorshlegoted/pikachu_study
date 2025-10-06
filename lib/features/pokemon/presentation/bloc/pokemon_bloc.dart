import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachi_dobre/core/utils/usecase/usecase.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/pokemon.dart';
import 'package:pikachi_dobre/features/pokemon/domain/usecases/get_pokemon_by_name.dart';
import 'package:pikachi_dobre/features/pokemon/domain/usecases/get_random_pokemon.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

typedef _Emit = Emitter<PokemonState>;

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc({
    required GetPokemonByNameUseCase getPokemonByNameUseCase,
    required GetRandomPokemonUseCase getRandomPokemonUseCase,
  }) : _getPokemonByNameUseCase = getPokemonByNameUseCase,
       _getRandomPokemonUseCase = getRandomPokemonUseCase,
       super(const PokemonLoading()) {
        on<GetPokemonByNameEvent>(_onGetPokemonByName);
        on<GetRandomPokemonEvent>(_onGetRandomPokemon);
       }

  final GetPokemonByNameUseCase _getPokemonByNameUseCase;
  final GetRandomPokemonUseCase _getRandomPokemonUseCase;

  Future<void> _onGetPokemonByName(
    GetPokemonByNameEvent event,
    _Emit emit,
  ) async {
    emit(const PokemonLoading());

    final result = await _getPokemonByNameUseCase.call(
      GetPokemonByNameParams(name: event.name),
    );

    result.fold(
      (failure) => emit(PokemonError(message: failure.error)),
      (pokemon) => emit(PokemonLoaded(pokemon: pokemon)),
    );
  }

  Future<void> _onGetRandomPokemon(
    GetRandomPokemonEvent event,
    _Emit emit,
  ) async {
    emit(const PokemonLoading());

    final result = await _getRandomPokemonUseCase.call(NoParams());

    result.fold(
      (failure) => emit(PokemonError(message: failure.error)),
      (pokemon) => emit(PokemonLoaded(pokemon: pokemon)),
    );
  }
}
