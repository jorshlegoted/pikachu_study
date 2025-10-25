import 'package:pikachi_dobre/core/core.dart';
import 'package:pikachi_dobre/features/features.dart';

class Other extends Equatable {
  final Home home;

  const Other({required this.home});
  
  @override
  List<Object?> get props => [home];


}