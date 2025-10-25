import 'package:pikachi_dobre/core/core.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({required Widget child, super.key}) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppConstants.strings.background),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(child: _child),
      ),
    );
  }
}
