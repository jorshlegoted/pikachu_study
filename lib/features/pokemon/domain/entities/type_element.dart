import 'package:equatable/equatable.dart';

class TypeElement extends Equatable {
  final Type type;

  TypeElement({required this.type});
  
  @override
  List<Object?> get props => [type];

  
}