import 'package:pikachi_dobre/features/pokemon/data/models/other_model.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/sprites.dart';

final class SpritesModel extends Sprites {
  SpritesModel({required super.other});

  factory SpritesModel.fromJson(Map<String, dynamic> json) => SpritesModel(
    other: OtherModel.fromJson(json['other'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'other': (other as OtherModel).toJson(),
  };
}
