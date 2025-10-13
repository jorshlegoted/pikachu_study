import 'package:flutter/material.dart';
import 'package:pikachi_dobre/core/utils/constants/app_colors.dart';
import 'package:pikachi_dobre/core/utils/constants/app_strings.dart';

class SearchFormWidget extends StatefulWidget {
  const SearchFormWidget({super.key});

  @override
  State<SearchFormWidget> createState() => _SearchFormWidgetState();
}

class _SearchFormWidgetState extends State<SearchFormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              focusColor: AppColors.primary,

              labelText: AppStrings.pokemonNameField,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.pokemonNameValidation;
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                print('Ищем покемона');
              }
            },
            child: Text(AppStrings.findPokemonButton),
          ),
        ],
      ),
    );
  }
}
