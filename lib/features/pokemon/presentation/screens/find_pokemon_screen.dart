import 'package:flutter/material.dart';
import 'package:pikachi_dobre/core/utils/constants/app_colors.dart';
import 'package:pikachi_dobre/core/utils/constants/app_paddings.dart';
import 'package:pikachi_dobre/core/utils/constants/app_strings.dart';
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
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                iconSize: 50,
                color: AppColors.primary,
                onPressed: () => Navigator.pop(context),
                icon: Row(
                  children: [
                    Icon(Icons.chevron_left),
                    Text(
                      AppStrings.backButton,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.3),
            SearchFormWidget(),
          ],
        ),
      ),
    );
  }
}
