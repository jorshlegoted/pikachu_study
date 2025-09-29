import 'package:pikachi_dobre/features/pokemon/domain/entities/pokemon_type.dart';

final class PokemonTypeModel extends PokemonType {
  PokemonTypeModel({required super.name});

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) =>
      PokemonTypeModel(name: json['name'] as String);
}
