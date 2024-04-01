import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moedapp/src/currency_provider.dart';
import 'package:moedapp/src/home_view.dart';
import 'package:moedapp/src/navigation_controller_provider.dart';
import 'package:provider/provider.dart';

import 'src/constants/app_theme.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (_) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => NavigationControllerProvider(),
          ),
          ChangeNotifierProvider(create: (context) => CurrencyProvider()),
        ],
        child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: const MyApp()),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: AppTheme.fontFamilyName,
        cardTheme: const CardTheme(
          surfaceTintColor: Colors.white,
        ),
      ),
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
      initialRoute: "/",
    );
  }
}
