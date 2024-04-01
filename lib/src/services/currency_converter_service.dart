import 'dart:convert';
import 'dart:io';

import 'package:moedapp/src/api.dart';
import 'package:moedapp/src/constants/api_routes.dart';
import 'package:moedapp/src/models/frankfurter_latest_model.dart';

/// This service use `BRL` currency by default
/// but you could implement api requests to ip APIs
class CurrencyConverterService {
  final ApiClient _api = ApiClient();

  Future<FrankfurterLatestModel> getLatestCurrency({
    String? amount,
    String? fromCurrency,
    String? toCurrency,
  }) async {
    try {
      final response = await _api.get(Uri.parse(ApiRoutes.getLatestCurrency(
        amount: amount,
        fromCurrency: fromCurrency,
        toCurrency: toCurrency,
      )));
      if (response.statusCode == 200) {
        return FrankfurterLatestModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 404) {
        throw Exception("URL não encontrada");
      } else {
        throw Exception("Erro ao buscar informações");
      }
    } on SocketException catch (_) {
      throw "Sem conexão com a internet, tente novamente mais tarde";
    } catch (e) {
      throw "Ocorreu um erro desconhecido, entre em contato com o suporte";
    }
  }
}
