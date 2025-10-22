part of 'connection_checker_cubit.dart';

final class ConnectionCheckerState extends Equatable {
  const ConnectionCheckerState({this.hasConnection = true});

  final bool hasConnection;

  @override
  List<Object> get props => [hasConnection];
}
