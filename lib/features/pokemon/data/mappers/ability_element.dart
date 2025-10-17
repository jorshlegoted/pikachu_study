import 'package:pikachi_dobre/features/pokemon/data/mappers/ability_mapper.dart';
import 'package:pikachi_dobre/features/pokemon/data/models/ability_element_model.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/ability_element.dart';

extension AbilityElementToModel on AbilityElement {
  AbilityElementModel toModel() =>
    AbilityElementModel(ability: ability.toModel());
}