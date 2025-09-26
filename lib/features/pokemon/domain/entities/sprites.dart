import 'package:equatable/equatable.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/other.dart';

class Sprites extends Equatable {
  final Other other;

  Sprites({required this.other});
  
  @override
  List<Object?> get props => [other];
}