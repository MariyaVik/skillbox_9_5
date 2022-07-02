import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillbox_9_5/navigation.dart';
import 'package:skillbox_9_5/theme/theme_manager.dart';
import 'package:skillbox_9_5/theme/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeManager(),
        builder: (context, _) {
          final _themeManager = Provider.of<ThemeManager>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: _themeManager.themeMode,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            initialRoute: Navigation.initialRoute,
            onGenerateRoute: Navigation.onGenerateRoute,
          );
        });
  }
}
