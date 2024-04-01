import 'package:flutter/material.dart';
import 'package:moedapp/src/services/currency_converter_service.dart';

class CurrencyDropdownInput extends StatelessWidget {
  const CurrencyDropdownInput({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String value;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CurrencyConverterService().getCurrencies(),
        builder: (context, snapshot) {
          if (!snapshot.hasData && snapshot.data == null) {
            return SizedBox(
              width: 120,
              child: DropdownButtonFormField(
                value: value,
                items: const [],
                onChanged: (_) {},
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
            );
          }

          return SizedBox(
            width: 120,
            child: DropdownButtonFormField(
              value: value,
              onChanged: onChanged,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              items: snapshot.data!.keys.map(
                (String currency) {
                  return DropdownMenuItem<String>(
                    value: currency,
                    child: Text(
                      currency,
                      style:
                          const TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                  );
                },
              ).toList(),
            ),
          );
        });
  }
}
