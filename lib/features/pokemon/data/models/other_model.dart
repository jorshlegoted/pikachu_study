import 'package:pikachi_dobre/features/features.dart';

final class OtherModel extends Other {
  OtherModel({required super.home});

  factory OtherModel.fromJson(Map<String, dynamic> json) => OtherModel(
    home: HomeModel.fromJson(json['home'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'home': (home as HomeModel).toJson(),
  };
}
