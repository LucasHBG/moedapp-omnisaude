import 'package:moedapp/src/config.dart';

class ApiRoutes {
  static const String _baseApiUrl = Config.backendServiceEndpoint;

  static String getLatestCurrency(
          {String? amount, String? fromCurrency, String? toCurrency}) =>
      '$_baseApiUrl/latest?amount=${amount ?? "10.00"}&&from=${fromCurrency ?? "BRL"}&to=${toCurrency ?? "USD"}';
}
