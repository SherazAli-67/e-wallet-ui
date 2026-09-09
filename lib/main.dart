import 'package:e_wallet/constants/string_const.dart';
import 'package:e_wallet/router/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: StringConst.appTitle,
      theme: ThemeData(
        brightness: .dark,
      ),
      routerConfig: router,
      builder: (_, child) => child!,
    );
  }
}