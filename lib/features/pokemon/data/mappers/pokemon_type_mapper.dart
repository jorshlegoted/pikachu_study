import 'package:pikachi_dobre/features/pokemon/data/models/pokemon_type_model.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/pokemon_type.dart';

extension PokemonTypeToModel on PokemonType {
  PokemonTypeModel toModel() {
    return PokemonTypeModel(name: name);
  }
}