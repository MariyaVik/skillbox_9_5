import 'package:flutter/material.dart';
import 'package:skillbox_9_5/navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Navigation.initialRoute,
      onGenerateRoute: Navigation.onGenerateRoute,
    );
  }
}
