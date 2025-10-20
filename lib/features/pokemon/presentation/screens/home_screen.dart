import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachi_dobre/core/utils/constants/app_strings.dart';
import 'package:pikachi_dobre/core/widgets/app_scaffold.dart';
import 'package:pikachi_dobre/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pikachi_dobre/features/pokemon/presentation/screens/find_pokemon_screen.dart';
import 'package:pikachi_dobre/features/pokemon/presentation/screens/pokemon_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AppStrings.logo, scale: 9),
          Column(
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => FindPokemonScreen())),
                child: Text(AppStrings.findPokemonButton),
              ),
              BlocListener<PokemonBloc, PokemonState>(
                listenWhen: (_, current) {
                  if (current is PokemonLoaded) {
                    if (!current.isFromSearch) {
                      return true;
                    }
                  }
                  return false;
                },
                listener: (_, state) => switch (state) {
                  PokemonLoaded(:final pokemon) => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => PokemonDetailsScreen(pokemon: pokemon),
                    ),
                  ),
                  PokemonError(:final message) => ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(message.toString()))),
                  _ => null,
                },
                child: ElevatedButton(
                  onPressed: () =>
                      context.read<PokemonBloc>().add(GetRandomPokemonEvent()),
                  child: Text(AppStrings.randomPokemonButton),
                ),
              ),
            ],
          ),
          SizedBox.shrink(),
        ],
      ),
    );
  }
}
