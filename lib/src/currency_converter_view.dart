import 'package:flutter/material.dart';
import 'package:moedapp/src/common_widgets/loading_spinner_widget.dart';
import 'package:moedapp/src/constants/app_theme.dart';
import 'package:moedapp/src/currency_dropdown_input.dart';
import 'package:moedapp/src/currency_input.dart';
import 'package:moedapp/src/currency_provider.dart';
import 'package:moedapp/src/services/currency_converter_service.dart';
import 'package:moedapp/src/utils/custom_date_extension.dart';
import 'package:provider/provider.dart';

class CurrencyConverterView extends StatefulWidget {
  const CurrencyConverterView({super.key});

  @override
  State<CurrencyConverterView> createState() => _CurrencyConverterViewState();
}

class _CurrencyConverterViewState extends State<CurrencyConverterView> {
  final amountController = TextEditingController();

  double? convertedAmount;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Future _latestCurrenciesfuture;

  String initialFromValue = "BRL";
  String initialToValue = "USD";
  bool isLoading = false;

  @override
  void initState() {
    _latestCurrenciesfuture = CurrencyConverterService().getLatestCurrency();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currencyProvider = Provider.of<CurrencyProvider>(context);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text("Conversor de moedas", style: AppTheme.h1),
        ),
        FutureBuilder(
          future: _latestCurrenciesfuture,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.connectionState == ConnectionState.done) {
              convertedAmount = snapshot.data!.rates.values.first;
              if (context.mounted) {
                amountController.text = currencyProvider.currencyAmount;
              }

              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Data cotação: ${DateTime.now().getCurrentDate()}",
                      style: AppTheme.commonText,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CurrencyDropdownInput(
                          value: currencyProvider.fromCurrency == null
                              ? initialFromValue
                              : currencyProvider.fromCurrency!,
                          onChanged: (String? value) {
                            if (value != null) {
                              currencyProvider.setFromCurrency(value);
                            }
                          },
                        ),
                        IconButton(
                          onPressed: () async {
                            var result = await CurrencyConverterService()
                                .getLatestCurrency(
                              amount: amountController.value.text,
                              fromCurrency:
                                  currencyProvider.toCurrency ?? initialToValue,
                              toCurrency: currencyProvider.fromCurrency ??
                                  initialFromValue,
                            );

                            currencyProvider.setCurrencyAmount(
                              result.amount.toStringAsFixed(2),
                            );
                            currencyProvider.setFromCurrency(
                              result.base,
                            );
                            currencyProvider.setToCurrency(
                              result.rates.keys.first,
                            );
                            currencyProvider.setConvertedCurrency(
                              result.rates.values.first,
                            );

                            currencyProvider.addNewConvertedCurrency({
                              "${currencyProvider.fromCurrency}/${currencyProvider.toCurrency}":
                                  "${amountController.value.text}/${currencyProvider.convertedCurrency!.toStringAsFixed(2)}"
                            });
                          },
                          icon: const Icon(
                            Icons.compare_arrows_rounded,
                            size: 32,
                          ),
                        ),
                        CurrencyDropdownInput(
                          value: currencyProvider.toCurrency == null
                              ? initialToValue
                              : currencyProvider.toCurrency!,
                          onChanged: (String? value) {
                            if (value != null) {
                              currencyProvider.setToCurrency(value);
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CurrencyAmountInput(
                      controller: amountController,
                      isLoading: isLoading,
                      hintText: "15,00",
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          var result = await CurrencyConverterService()
                              .getLatestCurrency(
                            amount: amountController.value.text,
                            fromCurrency: currencyProvider.fromCurrency ??
                                initialFromValue,
                            toCurrency:
                                currencyProvider.toCurrency ?? initialToValue,
                          );

                          currencyProvider.setCurrencyAmount(
                            result.amount.toStringAsFixed(2),
                          );
                          currencyProvider.setFromCurrency(
                            result.base,
                          );
                          currencyProvider.setToCurrency(
                            result.rates.keys.first,
                          );
                          currencyProvider.setConvertedCurrency(
                            result.rates.values.first,
                          );

                          currencyProvider.addNewConvertedCurrency({
                            "${currencyProvider.fromCurrency}/${currencyProvider.toCurrency}":
                                "${amountController.value.text}/${currencyProvider.convertedCurrency!.toStringAsFixed(2)}"
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: const Text(
                          "Converter",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Resultado: ", style: AppTheme.h2),
                    const SizedBox(height: 10),
                    Text(
                        "De: ${currencyProvider.fromCurrency ?? initialFromValue}",
                        style: AppTheme.commonText),
                    const SizedBox(height: 10),
                    Text(
                        "Para: ${currencyProvider.toCurrency ?? initialToValue}",
                        style: AppTheme.commonText),
                    const SizedBox(height: 10),
                    Text(
                      "Valor convertido: ${currencyProvider.convertedCurrency != null ? currencyProvider.convertedCurrency!.toStringAsFixed(2) : convertedAmount!.toStringAsFixed(2)}",
                      style: AppTheme.commonText,
                    ),
                  ],
                ),
              );
            }

            return const LoadingSpinnerWidget();
          },
        )
      ],
    );
  }
}
