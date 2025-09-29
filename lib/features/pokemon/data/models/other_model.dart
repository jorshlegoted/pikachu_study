import 'package:pikachi_dobre/features/pokemon/data/models/home_model.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/other.dart';

final class OtherModel extends Other {
  OtherModel({required super.home});

  factory OtherModel.fromJson(Map<String, dynamic> json) =>
      OtherModel(home: HomeModel.fromJson(json['home'] as Map<String, dynamic>));
}
