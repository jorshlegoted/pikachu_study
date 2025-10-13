import 'package:flutter/material.dart';
import 'package:pikachi_dobre/core/utils/constants/app_strings.dart';

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
            image: AssetImage(AppStrings.background),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(child: _child),
      ),
    );
  }
}
