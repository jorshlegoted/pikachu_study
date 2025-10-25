import 'package:pikachi_dobre/core/core.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        iconSize: AppConstants.sizes.commonSize50,
        color: AppConstants.colors.primary,
        onPressed: () => Navigator.pop(context),
        icon: Row(
          children: [
            Icon(Icons.chevron_left),
            Text(
              AppConstants.strings.backButton,
              style: TextStyle(
                fontSize: AppConstants.sizes.commonSize24,
                fontWeight: FontWeight.w800,
                color: AppConstants.colors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
