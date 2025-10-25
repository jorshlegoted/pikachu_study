import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final int weight;
  final List<AbilityElement> abilities;
  final Sprites sprites;
  final List<TypeElement> types;

  const Pokemon({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.sprites,
    required this.types,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    baseExperience,
    height,
    weight,
    abilities,
    sprites,
    types,
  ];
}
