import 'package:flutter/material.dart';
import 'package:wazirx_using_gorouter/routes/config.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WazirX',
      theme: ThemeData.dark(),
      routerDelegate: AppConfig.goRouter.routerDelegate,
      routeInformationParser: AppConfig.goRouter.routeInformationParser,
      debugShowCheckedModeBanner: false,
    );
  }
}




