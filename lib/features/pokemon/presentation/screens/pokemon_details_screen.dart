import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachi_dobre/core/utils/constants/app_paddings.dart';
import 'package:pikachi_dobre/core/utils/constants/app_sized_boxes.dart';
import 'package:pikachi_dobre/core/utils/constants/app_strings.dart';
import 'package:pikachi_dobre/core/widgets/app_back_button.dart';
import 'package:pikachi_dobre/core/widgets/app_scaffold.dart';
import 'package:pikachi_dobre/features/connection_checker/presentation/cubit/connection_checker_cubit.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/pokemon.dart';
import 'package:pikachi_dobre/features/pokemon/presentation/widgets/pokemon_abilities_widget.dart';
import 'package:pikachi_dobre/features/pokemon/presentation/widgets/pokemon_info_string.dart';
import 'package:pikachi_dobre/features/pokemon/presentation/widgets/pokemon_types_widget.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({required Pokemon pokemon, super.key})
    : _pokemon = pokemon;

  final Pokemon _pokemon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<ConnectionCheckerCubit, ConnectionCheckerState>(
      listener: (_, state) => state.hasConnection
          ? ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppStrings.hasInternetConnectionMessage)),
            )
          : ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppStrings.noInternetConnectionMessage)),
            ),
      child: AppScaffold(
        child: Column(
          children: [
            AppBackButton(),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    left: AppPaddings.screenPadding,
                    right: AppPaddings.screenPadding,
                    bottom: AppPaddings.screenPadding,
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Center(
                        child: _pokemon.sprites.other.home.frontDefault != null
                            ? CachedNetworkImage(
                                imageUrl:
                                    _pokemon.sprites.other.home.frontDefault!,
                              )
                            : Text('No image available'),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPaddings.screenPadding,
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            PokemonInfoString(
                              title: AppStrings.pokemonNameLabel,
                              value: _pokemon.name,
                            ),
                            PokemonInfoString(
                              title: AppStrings.baseExperienceLabel,
                              value: _pokemon.baseExperience.toString(),
                            ),
                            PokemonInfoString(
                              title: AppStrings.heightLabel,
                              value: _pokemon.height.toString(),
                            ),
                            PokemonInfoString(
                              title: AppStrings.weightLabel,
                              value: _pokemon.weight.toString(),
                            ),
                            PokemonAbilitiesWidget(pokemon: _pokemon),
                            PokemonTypesWidget(pokemon: _pokemon),
                            AppSizedBoxes.verticalSmallSizedBox,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
