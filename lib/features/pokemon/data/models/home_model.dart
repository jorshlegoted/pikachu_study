import 'package:pikachi_dobre/features/features.dart';

final class HomeModel extends Home {
  const HomeModel({required super.frontDefault});

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      HomeModel(frontDefault: json['front_default'] as String?);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'front_default': frontDefault,
  };
}
