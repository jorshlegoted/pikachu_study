import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';

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
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.sizes.commonSize16,
          ),
          child: Text(
            AppConstants.strings.abilitiesLabel,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.sizes.commonSize16,
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