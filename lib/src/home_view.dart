import 'package:flutter/material.dart';
import 'package:moedapp/src/constants/app_theme.dart';
import 'package:moedapp/src/currency_converter_view.dart';
import 'package:moedapp/src/history_view.dart';
import 'package:moedapp/src/home_bottom_navigation_bar_view.dart';
import 'package:provider/provider.dart';

Widget getPage(int index) {
  switch (index) {
    case 0:
      return const CurrencyConverterView();
    case 1:
      return const HistoryView();
    default:
      return const CurrencyConverterView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final int selectedIndex =
        Provider.of<NavigationControllerProvider>(context).selectedIndex;

    return Scaffold(
      backgroundColor: AppTheme.appBackgroundColor,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: const HomeBottomNavigationBarView(),
      body: SizedBox(
        width: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 32.0,
            right: 32.0,
            top: 8.0,
          ),
          child: getPage(selectedIndex),
        ),
      ),
    );
  }
}
