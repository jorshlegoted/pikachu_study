import 'package:pikachi_dobre/features/pokemon/data/mappers/other_mapper.dart';
import 'package:pikachi_dobre/features/pokemon/data/models/sprites_model.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/sprites.dart';

extension SpritesToModel on Sprites {
  SpritesModel toModel() => SpritesModel(other: other.toModel());
}