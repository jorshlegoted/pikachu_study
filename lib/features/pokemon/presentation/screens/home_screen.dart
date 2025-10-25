import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<ConnectionCheckerCubit>().startListening();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectionCheckerCubit, ConnectionCheckerState>(
      listener: (_, state) => state.hasConnection
          ? ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppConstants.strings.hasInternetConnectionMessage)),
            )
          : ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppConstants.strings.noInternetConnectionMessage)),
            ),
      child: AppScaffold(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(AppConstants.strings.logo, scale: 9),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => FindPokemonScreen()),
                  ),
                  child: Text(AppConstants.strings.findPokemonButton),
                ),
                BlocListener<PokemonBloc, PokemonState>(
                  listenWhen: (_, current) {
                    if (current is PokemonLoaded) {
                      if (!current.isFromSearch) {
                        return true;
                      }
                    }
                    return false;
                  },
                  listener: (_, state) => switch (state) {
                    PokemonLoaded(:final pokemon) => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => PokemonDetailsScreen(pokemon: pokemon),
                      ),
                    ),
                    PokemonError(:final message) => ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(message.toString()))),
                    _ => null,
                  },
                  child: ElevatedButton(
                    onPressed: () => context.read<PokemonBloc>().add(
                      GetRandomPokemonEvent(),
                    ),
                    child: Text(AppConstants.strings.randomPokemonButton),
                  ),
                ),
              ],
            ),
            SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
