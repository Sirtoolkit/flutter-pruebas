import 'package:flutter/material.dart';
import 'package:flutter_prueba/provider/dialog.location.provider%20.dart';
import 'package:flutter_prueba/provider/dialog.user.provider.dart';
import 'package:flutter_prueba/provider/home.provider.dart';
import 'package:flutter_prueba/screen/home.screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider.init()),
        ChangeNotifierProvider(create: (_) => DialogUserProvider.init()),
        ChangeNotifierProvider(create: (_) => DialogLocationProvider.init()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
