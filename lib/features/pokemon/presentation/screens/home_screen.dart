import 'package:flutter/material.dart';
import 'package:pikachi_dobre/core/utils/constants/app_strings.dart';
import 'package:pikachi_dobre/core/widgets/app_scaffold.dart';
import 'package:pikachi_dobre/features/pokemon/presentation/screens/find_pokemon_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AppStrings.logo, scale: 9),
          Column(
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => FindPokemonScreen())),
                child: Text(AppStrings.findPokemonButton),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(AppStrings.randomPokemonButton),
              ),
            ],
          ),
          SizedBox.shrink(),
        ],
      ),
    );
  }
}
