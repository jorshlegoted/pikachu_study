import 'package:pikachi_dobre/features/features.dart';

extension OtherToModel on Other {
  OtherModel toModel() =>
    OtherModel(home: home.toModel());
}