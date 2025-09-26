import 'package:equatable/equatable.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/ability_element.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/sprites.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/type_element.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final int weight;
  final List<AbilityElement> abilities;
  final Sprites sprites;
  final List<TypeElement> types;

  Pokemon({
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
