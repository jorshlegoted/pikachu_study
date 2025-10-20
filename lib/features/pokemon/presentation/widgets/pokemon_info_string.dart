import 'package:flutter/material.dart';
import 'package:pikachi_dobre/core/utils/constants/app_paddings.dart';
import 'package:pikachi_dobre/core/utils/constants/app_sized_boxes.dart';

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
      padding: const EdgeInsets.symmetric(
        horizontal: AppPaddings.screenPadding,
      ),
      child: Row(
        children: [
          Text(
            _title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSizedBoxes.horizontalSmallSizedBox,
          Text(_value, style: theme.textTheme.headlineMedium),
        ],
      ),
    );
  }
}
