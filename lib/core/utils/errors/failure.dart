import 'package:equatable/equatable.dart';

sealed class Failure with EquatableMixin implements Exception {
  final String? error;
  final StackTrace? stackTrace;

  Failure({required this.error, required this.stackTrace});

  @override
  List<Object?> get props => [error, stackTrace];
}