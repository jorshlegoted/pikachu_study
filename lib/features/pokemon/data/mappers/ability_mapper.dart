import 'package:pikachi_dobre/features/pokemon/data/models/ability_model.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/ability.dart';

extension AbilityToModel on Ability {
  AbilityModel toModel() => AbilityModel(name: name);
}