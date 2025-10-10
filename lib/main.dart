import 'package:flutter/material.dart';
import 'package:pikachi_dobre/core/dependencies/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencyInjection();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
