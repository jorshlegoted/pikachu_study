import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachi_dobre/core/utils/constants/app_colors.dart';
import 'package:pikachi_dobre/core/utils/constants/app_strings.dart';
import 'package:pikachi_dobre/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pikachi_dobre/features/pokemon/presentation/screens/pokemon_details_screen.dart';

class SearchFormWidget extends StatefulWidget {
  const SearchFormWidget({super.key});

  @override
  State<SearchFormWidget> createState() => _SearchFormWidgetState();
}

class _SearchFormWidgetState extends State<SearchFormWidget> {
  final _formKey = GlobalKey<FormState>();
  String? _pokemonName;

  void _onPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      if (_pokemonName == null) return;

      context.read<PokemonBloc>().add(
        GetPokemonByNameEvent(name: _pokemonName!.toLowerCase()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PokemonBloc, PokemonState>(
      listener: (_, state) => switch (state) {
        PokemonLoaded(:final pokemon) => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => PokemonDetailsScreen(pokemon: pokemon),
          ),
        ),
        PokemonError(:final message) =>
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message ?? 'Что-то пошло не так')),
          ),
        _ => null,
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                print('Current input: $value');
              },
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
              onSaved: (newValue) => _pokemonName = newValue,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _onPressed,
              child: Text(AppStrings.findPokemonButton),
            ),
          ],
        ),
      ),
    );
  }
}
