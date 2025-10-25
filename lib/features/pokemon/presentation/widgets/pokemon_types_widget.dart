import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';

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
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.sizes.commonSize16,
          ),
          child: Text(
            AppConstants.strings.typesLabel,
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