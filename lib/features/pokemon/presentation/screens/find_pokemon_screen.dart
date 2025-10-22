import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachi_dobre/core/utils/constants/app_paddings.dart';
import 'package:pikachi_dobre/core/utils/constants/app_strings.dart';
import 'package:pikachi_dobre/core/widgets/app_back_button.dart';
import 'package:pikachi_dobre/core/widgets/app_scaffold.dart';
import 'package:pikachi_dobre/features/connection_checker/presentation/cubit/connection_checker_cubit.dart';
import 'package:pikachi_dobre/features/pokemon/presentation/widgets/search_form_widget.dart';

class FindPokemonScreen extends StatelessWidget {
  const FindPokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<ConnectionCheckerCubit, ConnectionCheckerState>(
      listener: (_, state) => state.hasConnection
          ? ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppStrings.hasInternetConnectionMessage)),
            )
          : ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppStrings.noInternetConnectionMessage)),
            ),
      child: AppScaffold(
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
      ),
    );
  }
}
