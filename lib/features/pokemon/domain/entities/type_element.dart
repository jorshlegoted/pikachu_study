import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';

class TypeElement extends Equatable {
  final PokemonType type;

  const TypeElement({required this.type});
  
  @override
  List<Object?> get props => [type];

  
}