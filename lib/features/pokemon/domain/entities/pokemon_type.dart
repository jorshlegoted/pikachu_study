import 'package:pikachi_dobre/core/core.dart';

class PokemonType extends Equatable{
  const PokemonType({required this.name});

  final String name;
  
  @override
  List<Object?> get props => [name];
}