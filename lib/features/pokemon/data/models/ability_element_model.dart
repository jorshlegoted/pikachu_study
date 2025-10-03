import 'package:pikachi_dobre/features/pokemon/data/models/ability_model.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/ability_element.dart';

final class AbilityElementModel extends AbilityElement {
  const AbilityElementModel({required super.ability});

  factory AbilityElementModel.fromJson(Map<String, dynamic> json) =>
      AbilityElementModel(
        ability: AbilityModel.fromJson(json['ability'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'ability': (ability as AbilityModel).toJson(),
  };
}
