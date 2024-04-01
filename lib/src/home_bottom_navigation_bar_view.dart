import 'package:flutter/material.dart';
import 'package:moedapp/src/navigation_controller_provider.dart';
import 'package:provider/provider.dart';

class HomeBottomNavigationBarView extends StatelessWidget {
  const HomeBottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationControllerProvider =
        Provider.of<NavigationControllerProvider>(context);

    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      onDestinationSelected: (int selectedDestination) {
        return navigationControllerProvider
            .setSelectedIndex(selectedDestination);
      },
      selectedIndex: navigationControllerProvider.selectedIndex,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.currency_exchange),
          label: 'Conversão',
        ),
        NavigationDestination(
          icon: Icon(Icons.history),
          label: 'Histórico',
        ),
      ],
    );
  }
}
