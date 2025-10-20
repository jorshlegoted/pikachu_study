import 'package:flutter/material.dart';
import 'package:pikachi_dobre/core/utils/constants/app_paddings.dart';
import 'package:pikachi_dobre/core/utils/constants/app_strings.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/pokemon.dart';

class PokemonTypesWidget extends StatelessWidget {
  const PokemonTypesWidget({super.key, required Pokemon pokemon})
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
            AppStrings.typesLabel,
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
          itemCount: _pokemon.types.length,
          itemBuilder: (_, index) {
            final type = _pokemon.types[index];

            return Text(type.type.name, style: theme.textTheme.headlineMedium);
          },
        ),
      ],
    );
  }
}