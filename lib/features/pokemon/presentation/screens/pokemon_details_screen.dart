import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';

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
              SnackBar(
                content: Text(
                  AppConstants.strings.hasInternetConnectionMessage,
                ),
              ),
            )
          : ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppConstants.strings.noInternetConnectionMessage),
              ),
            ),
      child: AppScaffold(
        child: Column(
          children: [
            AppBackButton(),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    left: AppConstants.sizes.commonSize16,
                    right: AppConstants.sizes.commonSize16,
                    bottom: AppConstants.sizes.commonSize16,
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
                            : Text(AppConstants.strings.noImageAvailable),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.sizes.commonSize16,
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            PokemonInfoString(
                              title: AppConstants.strings.pokemonNameLabel,
                              value: _pokemon.name,
                            ),
                            PokemonInfoString(
                              title: AppConstants.strings.baseExperienceLabel,
                              value: _pokemon.baseExperience.toString(),
                            ),
                            PokemonInfoString(
                              title: AppConstants.strings.heightLabel,
                              value: _pokemon.height.toString(),
                            ),
                            PokemonInfoString(
                              title: AppConstants.strings.weightLabel,
                              value: _pokemon.weight.toString(),
                            ),
                            PokemonAbilitiesWidget(pokemon: _pokemon),
                            PokemonTypesWidget(pokemon: _pokemon),
                            AppConstants.sizedBoxes.verticalSizedBox8,
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
