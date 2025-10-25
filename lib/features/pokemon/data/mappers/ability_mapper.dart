import 'package:pikachi_dobre/features/features.dart';

extension AbilityToModel on Ability {
  AbilityModel toModel() => AbilityModel(name: name);
}