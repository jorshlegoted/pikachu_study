import 'package:equatable/equatable.dart';

sealed class Failure with EquatableMixin implements Exception {
  final String? error;
  final StackTrace? stackTrace;

  Failure({required this.error, required this.stackTrace});

  @override
  List<Object?> get props => [error, stackTrace];
}

// ! -------------------- Local Storage Failures -------------------

class SQFliteFailure extends Failure {
  SQFliteFailure({super.error, super.stackTrace});
}

// ! --------------- Pokenon -------------
class PokemonFailure extends Failure {
  PokemonFailure({super.error, super.stackTrace});
}

// ! ------------------ Network Failures ---------------
class NetworkFailure extends Failure {
  NetworkFailure({super.error, super.stackTrace});
}

// ! ----------------- Connection Checker ------------------
class ConnectionFailure extends Failure {
  ConnectionFailure({super.error, super.stackTrace});
}
