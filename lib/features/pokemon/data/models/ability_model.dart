import 'package:pikachi_dobre/features/pokemon/domain/entities/ability.dart';

final class AbilityModel extends Ability {
  const AbilityModel({required super.name});

  factory AbilityModel.fromJson(Map<String, dynamic> json) => 
  AbilityModel(name: json['name']);
}