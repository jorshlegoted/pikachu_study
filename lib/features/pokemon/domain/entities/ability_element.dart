import 'package:equatable/equatable.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/ability.dart';

class AbilityElement extends Equatable{
  final Ability ability;

  const AbilityElement({required this.ability});
  
  @override
  List<Object?> get props => [ability];



}