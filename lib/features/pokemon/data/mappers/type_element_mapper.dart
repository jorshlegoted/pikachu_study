import 'package:pikachi_dobre/features/features.dart';

extension TypeElementToModel on TypeElement {
  TypeElementModel toModel() {
    return TypeElementModel(type: type.toModel());
  }
}