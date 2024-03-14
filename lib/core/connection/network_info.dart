//import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

// * Burada internet bağlantısının olup olmadığını kontrol eden bir method var var.
// * Yine İnternet hakkındaki diğer methodları da burada yazabiliriz.
// * Çok uzarsa sanal ve implemente edilmiş sınıflar ayrı dosyalarda değerlendirilebilir.
abstract class NetworkInfo {
  Future<bool>? get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool>? get isConnected => connectionChecker.hasInternetAccess;
}
