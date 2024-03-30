import 'package:moedapp/src/config.dart';

class ApiRoutes {
  static const String _baseApiUrl = Config.backendServiceEndpoint;

  static String getLatestCurrency({String? fromCurrency, String? toCurrency}) =>
      '$_baseApiUrl/latest?from=${fromCurrency ?? "BRL"}&to=${toCurrency ?? "USD"}';
}
