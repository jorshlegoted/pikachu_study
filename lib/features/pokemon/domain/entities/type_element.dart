import 'package:equatable/equatable.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/pokemon_type.dart';

class TypeElement extends Equatable {
  final PokemonType type;

  TypeElement({required this.type});
  
  @override
  List<Object?> get props => [type];

  
}