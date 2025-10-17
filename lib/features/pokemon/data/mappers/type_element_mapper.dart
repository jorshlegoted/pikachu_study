import 'package:pikachi_dobre/features/pokemon/data/mappers/pokemon_type_mapper.dart';
import 'package:pikachi_dobre/features/pokemon/data/models/type_element_model.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/type_element.dart';

extension TypeElementToModel on TypeElement {
  TypeElementModel toModel() {
    return TypeElementModel(type: type.toModel());
  }
}