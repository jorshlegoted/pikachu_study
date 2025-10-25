import 'package:pikachi_dobre/features/features.dart';

final class TypeElementModel extends TypeElement {
  TypeElementModel({required super.type});

  factory TypeElementModel.fromJson(Map<String, dynamic> json) =>
      TypeElementModel(
        type: PokemonTypeModel.fromJson(json['type'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'type': (type as PokemonTypeModel).toJson(),
  };
}
