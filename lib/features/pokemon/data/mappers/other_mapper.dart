import 'package:pikachi_dobre/features/pokemon/data/mappers/home_mapper.dart';
import 'package:pikachi_dobre/features/pokemon/data/models/other_model.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/other.dart';

extension OtherToModel on Other {
  OtherModel toModel() =>
    OtherModel(home: home.toModel());
}