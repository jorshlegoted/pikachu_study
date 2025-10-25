import 'package:pikachi_dobre/core/core.dart';

class Home extends Equatable {
  const Home({required this.frontDefault});

  final String? frontDefault;

  @override
  List<Object?> get props => [frontDefault];
}