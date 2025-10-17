import 'package:flutter/material.dart';
import 'package:pikachi_dobre/core/utils/constants/app_colors.dart';
import 'package:pikachi_dobre/core/utils/constants/app_paddings.dart';
import 'package:pikachi_dobre/core/utils/constants/app_strings.dart';
import 'package:pikachi_dobre/core/widgets/app_back_button.dart';
import 'package:pikachi_dobre/core/widgets/app_scaffold.dart';
import 'package:pikachi_dobre/features/pokemon/presentation/widgets/search_form_widget.dart';

class FindPokemonScreen extends StatelessWidget {
  const FindPokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPaddings.screenPadding,
        ),
        child: Column(
          children: [
            AppBackButton(),
            SizedBox(height: size.height * 0.3),
            SearchFormWidget(),
          ],
        ),
      ),
    );
  }
}
