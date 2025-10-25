import 'package:pikachi_dobre/features/features.dart';

extension AbilityElementToModel on AbilityElement {
  AbilityElementModel toModel() =>
    AbilityElementModel(ability: ability.toModel());
}