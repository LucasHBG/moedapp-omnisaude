import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moedapp/src/common_widgets/input_form_decorator.dart';
import 'package:moedapp/src/constants/app_theme.dart';
import 'package:moedapp/src/utils/currency_input_formatter.dart';

class CurrencyAmountInput extends StatelessWidget {
  const CurrencyAmountInput({
    super.key,
    required this.controller,
    required this.isLoading,
    this.hintText,
  });

  final TextEditingController controller;
  final bool isLoading;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: isLoading ? false : true,
      style: AppTheme.inputValue,
      keyboardType: TextInputType.number,
      onSaved: (String? value) =>
          value != null ? controller.text = value.trim() : null,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        CurrencyInputFormatter(),
      ],
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'O campo não pode estar vazio';
        }
        if (num.parse(value) == 0) return 'Quantidade não pode ser zero.';
        return null;
      },
      decoration: inputFormDecorator(
          hintText: hintText ?? "100.00", prefixText: "Quantia: "),
    );
  }
}
