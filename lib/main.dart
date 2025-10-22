import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachi_dobre/core/dependencies/injection_container.dart';
import 'package:pikachi_dobre/features/connection_checker/presentation/cubit/connection_checker_cubit.dart';
import 'package:pikachi_dobre/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pikachi_dobre/features/pokemon/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencyInjection();

  runApp(PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonBloc>(create: (_) => sl<PokemonBloc>()),
        BlocProvider(create: (context) => sl<ConnectionCheckerCubit>()),
      ],
      child: MaterialApp(home: const HomeScreen()),
    );
  }
}
