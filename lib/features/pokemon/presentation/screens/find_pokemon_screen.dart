import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';


class FindPokemonScreen extends StatelessWidget {
  const FindPokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<ConnectionCheckerCubit, ConnectionCheckerState>(
      listener: (_, state) => state.hasConnection
          ? ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppConstants.strings.hasInternetConnectionMessage)),
            )
          : ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppConstants.strings.noInternetConnectionMessage)),
            ),
      child: AppScaffold(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.sizes.commonSize16,
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
