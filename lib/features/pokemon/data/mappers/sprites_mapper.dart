import 'package:pikachi_dobre/features/features.dart';

extension SpritesToModel on Sprites {
  SpritesModel toModel() => SpritesModel(other: other.toModel());
}