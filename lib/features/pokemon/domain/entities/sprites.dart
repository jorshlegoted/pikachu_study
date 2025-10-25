import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';

class Sprites extends Equatable {
  final Other other;

  const Sprites({required this.other});
  
  @override
  List<Object?> get props => [other];
}