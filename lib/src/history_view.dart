import 'package:flutter/material.dart';
import 'package:moedapp/src/constants/app_theme.dart';
import 'package:moedapp/src/currency_provider.dart';
import 'package:provider/provider.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyProvider = Provider.of<CurrencyProvider>(context);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text("Histórico", style: AppTheme.h1),
        ),
        // Lista renderizada com as converões mais recentes no topo
        Expanded(
          child: ListView.builder(
            restorationId: "historyListView",
            itemCount: currencyProvider.convertedCurrencies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(12),
                      right: Radius.circular(12),
                    ),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          currencyProvider.convertedCurrencies
                              .elementAt(index)
                              .keys
                              .elementAt(0),
                          style: AppTheme.commonText,
                        ),
                        Text(
                          currencyProvider.convertedCurrencies
                              .elementAt(index)
                              .values
                              .elementAt(0),
                          style: AppTheme.commonText,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
