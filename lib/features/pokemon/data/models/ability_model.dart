import 'package:pikachi_dobre/features/features.dart';

final class AbilityModel extends Ability {
  const AbilityModel({required super.name});

  factory AbilityModel.fromJson(Map<String, dynamic> json) => 
  AbilityModel(name: json['name'] as String);

  Map<String, dynamic> toJson() => <String, dynamic>{'name': name};
}