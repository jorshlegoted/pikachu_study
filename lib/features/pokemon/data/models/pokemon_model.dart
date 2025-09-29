import 'package:pikachi_dobre/features/pokemon/data/models/ability_element_model.dart';
import 'package:pikachi_dobre/features/pokemon/data/models/sprites_model.dart';
import 'package:pikachi_dobre/features/pokemon/data/models/type_element_model.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/pokemon.dart';

// DTO модель для Pokemon.
final class PokemonModel extends Pokemon {
  PokemonModel({
    required super.id,
    required super.name,
    required super.baseExperience,
    required super.height,
    required super.weight,
    required super.abilities,
    required super.sprites,
    required super.types,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'] as int,
      name: json['name'] as String,
      baseExperience: json['base_experience'] as int,
      height: json['height'] as int,
      weight: json['weight'] as int,
      abilities: (json['abilities'] as List<dynamic>)
          .map((ability) => AbilityElementModel.fromJson(json))
          .toList(),
      sprites: SpritesModel.fromJson(json['sprites'] as Map<String, dynamic>),
      types: (json['types'] as List<dynamic>)
          .map((type) => TypeElementModel.fromJson(json))
          .toList(),
    );
  }
}
