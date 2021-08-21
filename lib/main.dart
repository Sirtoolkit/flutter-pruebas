import 'package:flutter/material.dart';
import 'package:flutter_prueba/providers/provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_prueba/services/services.dart';
import 'package:flutter_prueba/routers/routes.dart';
import 'package:flutter_prueba/themes/themes.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  NavigationServices.init();
  Fluro.setupRouter();
  setPathUrlStrategy();
  runApp(MyAppProvider());
}

class MyAppProvider extends StatelessWidget {
  const MyAppProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ApiProvider(),
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationServices.navigatorKey,
      theme: lightTheme,
      builder: builderRouter,
      initialRoute: HomeRoute,
      onGenerateRoute: Fluro.router.generator,
      
    );
  }
}
