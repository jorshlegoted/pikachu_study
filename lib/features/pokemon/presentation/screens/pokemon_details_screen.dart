import 'package:flutter/material.dart';
import 'package:pikachi_dobre/core/widgets/app_back_button.dart';
import 'package:pikachi_dobre/core/widgets/app_scaffold.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/pokemon.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({required Pokemon pokemon, super.key})
    : _pokemon = pokemon;

  final Pokemon _pokemon;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        children: [
          AppBackButton(),
          Center(
            child: _pokemon.sprites.other.home.frontDefault != null
                ? Image.network(_pokemon.sprites.other.home.frontDefault!)
                : Text('No image available'),
          ),
        ],
      ),
    );
  }
}
