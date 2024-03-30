import 'package:flutter/material.dart';
import 'package:moedapp/src/common_widgets/loading_spinner_widget.dart';
import 'package:moedapp/src/constants/app_theme.dart';
import 'package:moedapp/src/services/currency_converter_service.dart';

class CurrencyConverterView extends StatelessWidget {
  const CurrencyConverterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text("Conversor de moedas", style: AppTheme.title),
        ),
        FutureBuilder(
          future: CurrencyConverterService().getLatestCurrency(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.connectionState == ConnectionState.done) {}

            return const LoadingSpinnerWidget();
          },
        )
      ],
    );
  }
}
