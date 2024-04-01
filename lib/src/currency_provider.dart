import 'package:flutter/material.dart';

class CurrencyProvider extends ChangeNotifier {
  String _currencyAmount = "10.00";

  String get currencyAmount => _currencyAmount;

  void setCurrencyAmount(String newCurrencyAmount) {
    _currencyAmount = newCurrencyAmount;
    notifyListeners();
  }

  ///

  double? _convertedCurrency;

  double? get convertedCurrency => _convertedCurrency;

  void setConvertedCurrency(double newAmountConverted) {
    _convertedCurrency = newAmountConverted;
    notifyListeners();
  }

  ///

  String? _fromCurrency;

  String? get fromCurrency => _fromCurrency;

  void setFromCurrency(String newFromCurrency) {
    _fromCurrency = newFromCurrency;
    notifyListeners();
  }

  ///

  String? _toCurrency;

  String? get toCurrency => _toCurrency;

  void setToCurrency(String toCurrency) {
    _toCurrency = toCurrency;
    notifyListeners();
  }

  ///

  final List<Map<String, String>> _convertedCurrencies = [];

  // Aumenta complexidade, porém facilita a renderização com foco
  // no topo da lista. Usar reverse seta o foco bottom-up
  List<Map<String, String>> get convertedCurrencies =>
      _convertedCurrencies.reversed.toList();

  void addNewConvertedCurrency(Map<String, String> convertedCurrency) {
    _convertedCurrencies.add(convertedCurrency);
    notifyListeners();
  }
}
