import 'package:pikachi_dobre/features/pokemon/domain/entities/pokemon_type.dart';

final class PokemonTypeModel extends PokemonType {
  const PokemonTypeModel({required super.name});

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) =>
      PokemonTypeModel(name: json['name'] as String);

  Map<String, dynamic> toJson() => <String, dynamic>{'name': name};
}
