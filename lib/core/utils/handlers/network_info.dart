import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract interface class NetworkInfo {
  Stream<InternetStatus> onStatusChange();
  
  // [hasConnection] возвращает [Future] с
  Future<bool> get hasConnection;
}

final class NetworkInfoImpl implements NetworkInfo{
  NetworkInfoImpl({required InternetConnection connectionChecker})
  : _connectionChecker = connectionChecker;
  
  final InternetConnection _connectionChecker;
  
  @override
  // TODO: implement hasConnection
  Future<bool> get hasConnection => _connectionChecker.hasInternetAccess;

  @override
  Stream<InternetStatus> onStatusChange() => _connectionChecker.onStatusChange;
}