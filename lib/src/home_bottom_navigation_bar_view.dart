import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationControllerProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }
}

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
