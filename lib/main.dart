import 'package:flutter/material.dart';
import 'package:shopping_app/core/store.dart';
import 'package:shopping_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Screens/splash_screen.dart';

void main() => runApp(
      VxState(
        store: MyStore(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E Shopping',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      home: Splash(),
    );
  }
}
