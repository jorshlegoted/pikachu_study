import 'package:pikachi_dobre/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachi_dobre/features/features.dart';

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
        GetPokemonByNameEvent(
          name: _pokemonName!.toLowerCase(),
          isFromSearch: true,
        ),
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
            SnackBar(content: Text(message ?? AppConstants.strings.somethingWentWrongMessage)),
          ),
        _ => null,
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                focusColor: AppConstants.colors.primary,
                labelText: AppConstants.strings.pokemonNameField,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppConstants.strings.pokemonNameValidation;
                } else if (RegExp(r'[0-9]').hasMatch(value)) {
                  return AppConstants.strings.pokemonNameNumberValidation;
                }
                return null;
              },
              onSaved: (newValue) => _pokemonName = newValue,
            ),
            AppConstants.sizedBoxes.verticalSizedBox16,
            ElevatedButton(
              onPressed: _onPressed,
              child: Text(AppConstants.strings.findPokemonButton),
            ),
          ],
        ),
      ),
    );
  }
}
