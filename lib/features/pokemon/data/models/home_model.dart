import 'package:pikachi_dobre/features/pokemon/domain/entities/home.dart';

final class HomeModel extends Home {
  const HomeModel({required super.frontDefault});

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      HomeModel(frontDefault: json['front_default'] as String?);
}
