import 'package:pikachi_dobre/core/core.dart';

class PokemonInfoString extends StatelessWidget {
  const PokemonInfoString({
    super.key,
    required String title,
    required String value,
  }) : _title = title,
       _value = value;

  final String _title;
  final String _value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.sizes.commonSize16,
      ),
      child: Row(
        children: [
          Text(
            _title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          AppConstants.sizedBoxes.horizontalSizedBox8,
          Text(_value, style: theme.textTheme.headlineMedium),
        ],
      ),
    );
  }
}
