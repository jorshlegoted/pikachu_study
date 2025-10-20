import 'package:flutter/material.dart';
import 'package:pikachi_dobre/core/utils/constants/app_paddings.dart';
import 'package:pikachi_dobre/core/utils/constants/app_strings.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/pokemon.dart';

class PokemonAbilitiesWidget extends StatelessWidget {
  const PokemonAbilitiesWidget({super.key, required Pokemon pokemon})
    : _pokemon = pokemon;

  final Pokemon _pokemon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPaddings.screenPadding,
          ),
          child: Text(
            AppStrings.abilitiesLabel,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPaddings.screenPadding,
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _pokemon.abilities.length,
          itemBuilder: (_, index) {
            final ability = _pokemon.abilities[index];

            return Text(
              ability.ability.name,
              style: theme.textTheme.headlineMedium,
            );
          },
        ),
      ],
    );
  }
}