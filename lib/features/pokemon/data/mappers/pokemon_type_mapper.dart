import 'package:pikachi_dobre/features/features.dart';

extension PokemonTypeToModel on PokemonType {
  PokemonTypeModel toModel() {
    return PokemonTypeModel(name: name);
  }
}