import 'package:pikachi_dobre/features/pokemon/data/models/home_model.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/home.dart';

extension HomeToModel on Home {
  HomeModel toModel() => HomeModel(frontDefault: frontDefault);
}