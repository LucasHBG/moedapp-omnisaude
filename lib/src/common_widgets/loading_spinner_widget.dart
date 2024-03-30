import 'package:flutter/material.dart';
import 'package:moedapp/src/constants/app_theme.dart';

class LoadingSpinnerWidget extends StatelessWidget {
  const LoadingSpinnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: AppTheme.primaryColor,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
