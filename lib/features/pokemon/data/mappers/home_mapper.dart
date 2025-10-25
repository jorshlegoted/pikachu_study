import 'package:pikachi_dobre/features/features.dart';

extension HomeToModel on Home {
  HomeModel toModel() => HomeModel(frontDefault: frontDefault);
}