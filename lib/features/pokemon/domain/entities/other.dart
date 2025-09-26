import 'package:equatable/equatable.dart';
import 'package:pikachi_dobre/features/pokemon/domain/entities/home.dart';

class Other extends Equatable {
  final Home home;

  Other({required this.home});
  
  @override
  List<Object?> get props => [home];


}