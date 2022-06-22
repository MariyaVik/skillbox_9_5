import 'package:flutter/material.dart';
import 'package:skillbox_9_5/navigation.dart';
import 'package:skillbox_9_5/theme/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      initialRoute: Navigation.initialRoute,
      onGenerateRoute: Navigation.onGenerateRoute,
    );
  }
}
