import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';

class AbilityElement extends Equatable{
  final Ability ability;

  const AbilityElement({required this.ability});
  
  @override
  List<Object?> get props => [ability];



}